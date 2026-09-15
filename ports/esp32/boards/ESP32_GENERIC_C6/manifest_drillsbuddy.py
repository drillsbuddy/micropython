# Freeze the drillsbuddy-device application into the image (see
# mpconfigvariant_DRILLSBUDDY.cmake). The sibling checkout is expected at
# ../drillsbuddy-device relative to this MicroPython tree, or set
# DRILLSBUDDY_DEVICE_DIR.
import os

include("$(PORT_DIR)/boards/manifest.py")

# manifestfile.py runs this with the manifest's own directory as cwd
# (ports/esp32/boards/ESP32_GENERIC_C6).
_mpy_dir = os.path.abspath(os.path.join(os.getcwd(), "..", "..", "..", ".."))
_device = os.environ.get("DRILLSBUDDY_DEVICE_DIR") or os.path.normpath(
    os.path.join(_mpy_dir, "..", "drillsbuddy-device")
)
_src = os.path.join(_device, "src")
# main.py stays a file on flash (MicroPython only runs main.py from the
# filesystem); board_config.py is generated per device and flashed as a
# file; neither is frozen.
_skip = {"main.py", "board_config.py"}
_modules = sorted(
    f
    for f in os.listdir(_src)
    if f.endswith(".py") and f not in _skip and os.path.isfile(os.path.join(_src, f))
)
freeze(_src, _modules)
_imu = os.path.join(_device, "micropython-mpu9x50")
freeze(_imu, ["imu.py", "vector3d.py"])
