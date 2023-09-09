# Check video drivers in use
lspci -n -n -k | grep -A 2 -e VGA -e 3D

# Check active GPU driver
glxinfo | grep -e OpenGL.vendor -e OpenGL.renderer

# List available and default GPU
switcherooctl list
