ADD_OPTIONAL_PREBUILT()
{
    local DEVICE="$1"
    local BLOB="$3"
    local PREBUILT_PATH="$SRC_DIR/prebuilts/samsung/${DEVICE}/${BLOB}"

    if [ ! -e "$PREBUILT_PATH" ]; then
        LOGW "Optional prebuilt not found, skipping: ${PREBUILT_PATH//$SRC_DIR\//}"
        return 0
    fi

    ADD_TO_WORK_DIR "$@"
}

LOG_STEP_IN "- Adding S21 FE (r9sxxx) MIDAS"
DELETE_FROM_WORK_DIR "vendor" "etc/midas"
DELETE_FROM_WORK_DIR "vendor" "etc/VslMesDetector"
ADD_TO_WORK_DIR "r9sxxx" "vendor" "etc/midas"
ADD_OPTIONAL_PREBUILT "r9sxxx" "vendor" "etc/VslMesDetector"
LOG_STEP_OUT

LOG "- Fixing MIDAS model detection"
MIDAS_CONFIG="$WORK_DIR/vendor/etc/midas/midas_config.json"
if [ -f "$MIDAS_CONFIG" ] && [ -n "$TARGET_CODENAME" ]; then
    sed -i "s/r9s/${TARGET_CODENAME}/g" "$MIDAS_CONFIG"
else
    LOGW "MIDAS model configuration or TARGET_CODENAME is unavailable, skipping model replacement"
fi

LOG_STEP_IN "- Adding S21 FE (r9sxxx) Photo Remaster Service"
ADD_OPTIONAL_PREBUILT "r9sxxx" "system" "system/priv-app/PhotoRemasterService/PhotoRemasterService.apk"
LOG_STEP_OUT

LOG_STEP_IN "- Adding S21 FE (r9sxxx) MIDAS libraries"
ADD_OPTIONAL_PREBUILT "r9sxxx" "system" "system/lib64/libmidas_core.camera.samsung.so"
ADD_OPTIONAL_PREBUILT "r9sxxx" "system" "system/lib64/libmidas_DNNInterface.camera.samsung.so"
LOG_STEP_OUT
