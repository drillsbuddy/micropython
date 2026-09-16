# DrillsBuddy variant of ESP32_GENERIC_C3 - the ESP32-C3 pods' firmware
# (esp32c31, wsc3zero), with the drillsbuddy-device application frozen into
# the image, like the ESP32_GENERIC_C6 DRILLSBUDDY variant. On the C3 (400 KB
# SRAM, no PSRAM) this is what keeps BLE working at all: loading the pod
# application's ~130 KB of bytecode into the Python heap makes that heap grow
# in doubling steps, each taking the largest free block of the system heap -
# and NimBLE needs a ~60-80 KB contiguous system-heap block on activation.
# Once the application outgrew one more doubling (drillsbuddy-device #67;
# seen live 2026-09-16 as idf_largest=25 KB before BLE init, activation
# failing after a cold reset), no amount of gc.collect() could help. Frozen,
# the bytecode runs from flash and the Python heap stays small.
# No BLE connection changes: a C3 pod is a single-peripheral BLE device
# (it can't be a Master Mode pod), the stock NimBLE defaults apply.
list(APPEND SDKCONFIG_DEFAULTS
    boards/ESP32_GENERIC_C3/sdkconfig.drillsbuddy)

list(APPEND MICROPY_DEF_BOARD
    MICROPY_HW_BOARD_NAME="DrillsBuddy ESP32-C3"
)

set(MICROPY_FROZEN_MANIFEST ${MICROPY_BOARD_DIR}/../manifest_drillsbuddy.py)
