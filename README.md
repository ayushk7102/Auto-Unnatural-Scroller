# Auto-Unnatural-Scroller

Shell script to automatically invert scroll direction (setting 'off' Natural Scrolling) when a wire{d, less} mouse is connected. 
Turns on 'unnatural' scrolling which suits physical mouse wheels, while maintaining 'natural' scrolling on trackpads.

Useful if, like me, you're too lazy to change the setting every time you plug in a physical mouse.


Works on Ubuntu (tested on 18.04 LTS)

# Installation

1. Download the .sh file and place it in a directory for shell scripts : for eg. ```~/lib/sh```
2. If not installed already, install 'xinput', a utility to list and query information about a device and configure input devices via apt-get

```  sudo apt-get update -y  ```

```  sudo apt-get install -y xinput```

3. To enable the 

