# DrillsBuddy variant of ESP32_GENERIC_C6 - the pods' firmware, with:
#  - the drillsbuddy-device application frozen into the image (runs from
#    flash, ~0 RAM instead of ~130 KB of bytecode in the Python heap - which
#    was starving the BLE controller of the system heap it allocates a
#    master's third link and scan buffers from; a file flashed to the pod's
#    filesystem still overrides its frozen module, sys.path is '' first),
#  - controller memory for 4 connections reserved at init (see
#    sdkconfig.drillsbuddy).
# See plan-pod-master-mode.md in drillsbuddy/plans ("ESP32-C6 controller
# memory").
list(APPEND SDKCONFIG_DEFAULTS
    boards/ESP32_GENERIC_C6/sdkconfig.drillsbuddy)

list(APPEND MICROPY_DEF_BOARD
    MICROPY_HW_BOARD_NAME="DrillsBuddy ESP32-C6"
)

set(MICROPY_FROZEN_MANIFEST ${MICROPY_BOARD_DIR}/manifest_drillsbuddy.py)
