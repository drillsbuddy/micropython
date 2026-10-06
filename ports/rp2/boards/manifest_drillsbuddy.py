# Freeze the drillsbuddy-device application into the Pico W image (the
# RPI_PICO_W board's DRILLSBUDDY variant: mpconfigvariant_DRILLSBUDDY.cmake):
# the stock Pico W manifest (networking bundle, aioble) plus the application,
# shared with the ESP32 images: drillsbuddy/manifest_app.py.
include("$(BOARD_DIR)/manifest.py")
include("$(MPY_DIR)/drillsbuddy/manifest_app.py")
