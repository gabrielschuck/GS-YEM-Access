;Script that returns the screen resolution configured in the system.
func _desktop_resolution()
$resolution=""
    switch $resolution=""
        case @desktopwidth=640 and @desktopheight=480
            $resolution="640 x 480"
        case @desktopwidth=800 and @desktopheight=480
            $resolution="800 x 480"
        case @desktopwidth=854 and @desktopheight=480
            $resolution="854 x 480"
        case @desktopwidth=800 and @desktopheight=600
            $resolution="800 x 600"
        case @desktopwidth=960 and @desktopheight=540
            $resolution="960 x 540"
        case @desktopwidth=1024 and @desktopheight=576
            $resolution="1024 x 576"
        case @desktopwidth=1024 and @desktopheight=600
            $resolution="1024 x 600"
        case @desktopwidth=1024 and @desktopheight=768
            $resolution="1024 x 768"
        case @desktopwidth=1152 and @desktopheight=864
            $resolution="1152 x 864"
        case @desktopwidth=1280 and @desktopheight=720
    $resolution="1280 x 720"
        case @desktopwidth=1280 and @desktopheight=768
            $resolution="1280 x 768"
        case @desktopwidth=1280 and @desktopheight=800
            $resolution="1280 x 800"
        case @desktopwidth=1280 and @desktopheight=960
            $resolution="1280 x 960"
        case @desktopwidth=1280 and @desktopheight=1024
            $resolution="1280 x 1024"
        case @desktopwidth=1360 and @desktopheight=768
            $resolution="1360 x 768"
        case @desktopwidth=1366 and @desktopheight=768
            $resolution="1366 x 768"
        case @desktopwidth=1440 and @desktopheight=900
            $resolution="1440 x 900"
        case @desktopwidth=1400 and @desktopheight=1050
            $resolution="1440 x 900"
        case @desktopwidth=1600 and @desktopheight=900
            $resolution="1600 x 900"
        case @desktopwidth=1600 and @desktopheight=1200
            $resolution="1600 x 1200"
        case @desktopwidth=1680 and @desktopheight=1050
            $resolution="1680 x 1050"
        case @desktopwidth=1920 and @desktopheight=1080
            $resolution="1920 x 1080"
        case @desktopwidth=1920 and @desktopheight=1200
            $resolution="1920 x 1200"
        case @desktopwidth=1920 and @desktopheight=1400
            $resolution="1920 x 1400"
        case @desktopwidth=2048 and @desktopheight=1080
            $resolution="2048 x 1080"
        case @desktopwidth=2048 and @desktopheight=1152
            $resolution="2048 x 1152"
        case @desktopwidth=2048 and @desktopheight=1536
            $resolution="2048 x 1536"
        case @desktopwidth=2538 and @desktopheight=1080
            $resolution="2538 x 1080"
        case @desktopwidth=2560 and @desktopheight=1080
            $resolution="2560 x 1080"
        case @desktopwidth=2560 and @desktopheight=1440
            $resolution="2560 x 1440"
        case @desktopwidth=2560 and @desktopheight=1600
            $resolution="2560 x 1600"
        case @desktopwidth=2560 and @desktopheight=2048
            $resolution="2560 x 2048"
        case @desktopwidth=2880 and @desktopheight=900
            $resolution="2880 x 900"
        case @desktopwidth=3200 and @desktopheight=2048
            $resolution="3200 x 2048"
        case @desktopwidth=3200 and @desktopheight=2400
            $resolution="3200 x 2048"
        case @desktopwidth=3840 and @desktopheight=2160
            $resolution="3840 x 2160"
        case @desktopwidth=3840 and @desktopheight=2400
            $resolution="3840 x 2048"
        case @desktopwidth=4096 and @desktopheight=1716
            $resolution="4096 x 1716"
        case @desktopwidth=4096 and @desktopheight=3072
            $resolution="4096 x 3072"
        case @desktopwidth=5120 and @desktopheight=3200
            $resolution="5120 x 3200"
        case @desktopwidth=5120 and @desktopheight=4096
            $resolution="5120 x 4096"
        case @desktopwidth=6400 and @desktopheight=4096
            $resolution="6400 x 4096"
        case @desktopwidth=6400 and @desktopheight=4800
            $resolution="6400 x 4800"
        case @desktopwidth=7680 and @desktopheight=4320
            $resolution="7680 x 4320"
        case @desktopwidth=7680 and @desktopheight=4800
            $resolution="7680 x 4800"
        case else
        return seterror(1,0,$resolution)
        endswitch
    return $resolution
endfunc
