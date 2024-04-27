function update_brightness
    argparse 'd/device=' -- $argv

    switch $_flag_device
    case laptop 
        set device 'apple-panel-bl'
    case touchbar
        set device '228200000.display-pipe.0'
    case keyboard
        set device 'kbd_backlight'
    case '*'
        if set -q _flag_device
            set device $_flag_device
        else
            set device 'apple-panel-bl'
        end
    end
    echo $device
end
