# DrillsBuddy variant of RPI_PICO_W - the strips' firmware, with the
# drillsbuddy-device application frozen into the image: it runs from flash
# instead of ~130 KB of .mpy bytecode loaded into the Python heap, which left
# ~20 KB free and a garbage collection every few seconds - each followed by
# ~1.5 s in which 500 Hz hit sampling fell behind (drillsbuddy-device#117).
# A file flashed to the pod's filesystem still overrides its frozen module
# (sys.path is '' first).
# The board name stays the stock one (mpconfigboard.h defines it
# unconditionally; drillsbuddy-device's flash.sh recognises the board by it) -
# the frozen drillsbuddy_build module tells a DrillsBuddy image apart.

set(MICROPY_FROZEN_MANIFEST ${MICROPY_BOARD_DIR}/../manifest_drillsbuddy.py)
