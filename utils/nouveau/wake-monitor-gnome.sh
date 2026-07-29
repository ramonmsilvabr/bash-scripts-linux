#!/bin/bash
# nouveau struggles to wake my monitor up when in Power Saving mode, this script allow for the monitor to pick up signal by sending two pulses
# First pulse: Turn off
busctl --user set-property org.gnome.Mutter.DisplayConfig /org/gnome/Mutter/DisplayConfig org.gnome.Mutter.DisplayConfig PowerSaveMode i 2
sleep 0.3
# First pulse: Turn back on
busctl --user set-property org.gnome.Mutter.DisplayConfig /org/gnome/Mutter/DisplayConfig org.gnome.Mutter.DisplayConfig PowerSaveMode i 0
# Wait the exact timing for the monitor to pick up and exit power saving mode
sleep 1.5
# Second pulse: Turn off
busctl --user set-property org.gnome.Mutter.DisplayConfig /org/gnome/Mutter/DisplayConfig org.gnome.Mutter.DisplayConfig PowerSaveMode i 2 
sleep 0.3 
# Second pulse: Turn back on and ready for use
busctl --user set-property org.gnome.Mutter.DisplayConfig /org/gnome/Mutter/DisplayConfig org.gnome.Mutter.DisplayConfig PowerSaveMode i 0