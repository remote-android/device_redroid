#!/system/bin/sh

# args: driver
setup_vulkan() {
    echo "setup vulkan for driver: $1"
    case "$1" in
        i915)
            setprop ro.hardware.vulkan intel
            ;;
        amdgpu)
            setprop ro.hardware.vulkan radv
            ;;
        virtio_gpu)
            # google venus
            ;;
        *)
            echo "not supported driver: $1"
            ;;
    esac
}

setup_render_node() {
    node=`getprop ro.kernel.redroid.gpu.node`
    if [ ! -z "$node" ]; then
        echo "force render node: $node"

        setprop gralloc.gbm.device $node

        # setup vulkan
        cd /sys/kernel/debug/dri
        driver="`cat ${node: -3}/name | cut -d' ' -f1`"
        setup_vulkan $driver
        return 0
    fi

    cd /sys/kernel/debug/dri
    for d in * ; do
        if [ "$d" -ge "128" ]; then
            driver="`cat $d/name | cut -d' ' -f1`"
            echo "DRI node exists, driver: $driver"
            setup_vulkan $driver
            case $driver in
                i915|amdgpu|virtio_gpu)
                    node="/dev/dri/renderD$d"
                    echo "use render node: $node"
                    setprop gralloc.gbm.device $node
                    return 0
                    ;;
            esac
        fi
    done

    echo "NO qualified render node found"
    return 1
}

gpu_setup_host() {
    echo "use GPU host mode"

    setprop ro.hardware.egl mesa
    setprop ro.hardware.gralloc gbm
    setprop ro.kernel.redroid.fps 30
}

gpu_setup_guest() {
    echo "use GPU guest mode"

    setprop ro.hardware.egl swiftshader
    setprop ro.hardware.gralloc redroid
    setprop ro.hardware.vulkan pastel
}

gpu_setup() {
    ## redroid.gpu.mode=(auto, host, guest)
    ## redroid.gpu.node= (/dev/dri/renderDxxx)

    mode=`getprop ro.kernel.redroid.gpu.mode auto`
    if [ "$mode" = "host" ]; then
        setup_render_node
        gpu_setup_host
    elif [ "$mode" = "guest" ]; then
        gpu_setup_guest
    elif [ "$mode" = "auto" ]; then
         echo "use GPU auto mode"
         if setup_render_node; then
            gpu_setup_host
         else
            gpu_setup_guest
         fi
    else
        echo "unknown mode: $mode"
    fi
}

gpu_setup

