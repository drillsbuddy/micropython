# Freeze the drillsbuddy-device application into the image - shared by every
# board's DRILLSBUDDY variant (ESP32_GENERIC_C6, ESP32_GENERIC_C3: see their
# mpconfigvariant_DRILLSBUDDY.cmake). The application part is shared with the
# Pico W image: drillsbuddy/manifest_app.py.
include("$(PORT_DIR)/boards/manifest.py")
include("$(MPY_DIR)/drillsbuddy/manifest_app.py")
