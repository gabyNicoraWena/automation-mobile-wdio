#!/bin/bash


echo ""
echo "[Waiting for launcher to start]"
BDSAPP_READY=
BDSAPP_PACK=
while [[ -z ${BDSAPP_READY} ]]; do
    UI_FOCUS=`adb shell dumpsys window windows 2>/dev/null | grep -i mCurrentFocus`
    echo "(DEBUG) Current focus: ${UI_FOCUS}"

    case $UI_FOCUS in
    *"bdsol"*)
        BDSAPP_READY=true
    ;;
    *"Launcher"*)
        BDSAPP_PACK=`adb shell 'pm list packages -f' | sed -e 's/.*=//' | sort |grep bdsol`
        adb shell am start -n ${BDSAPP_PACK}/com.bds.MainActivity
        
    ;;
    "")
        echo "Waiting for window service..."
        sleep 3
    ;;
    *"ConversationListActivity"*)
        echo "Detected ConversationListActivity, Dismissing..."
        adb shell input keyevent KEYCODE_HOME
    ;;
    *"Not Responding"*)
        echo "Detected an ANR! Dismissing..."
        adb shell input keyevent KEYCODE_DPAD_DOWN
        adb shell input keyevent KEYCODE_DPAD_DOWN
        adb shell input keyevent KEYCODE_ENTER
    ;;
    *)
        echo "Waiting for launcher..."
        sleep 3
    ;;
    esac
done

echo "App is ready :-)"