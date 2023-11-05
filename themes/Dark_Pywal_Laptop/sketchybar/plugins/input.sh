#!/usr/bin/env sh

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.ABC') ICON='A' LABEL='EN';;
'com.apple.keylayout.WubixingKeyboard') ICON='五' LABEL='Wubi' ;;
'com.apple.keylayout.PinyinKeyboard') ICON='拼' LABEL='CN' ;;
'com.apple.keylayout.KANA') ICON='あ' LABEL='JP';;
'com.apple.keylayout.RussianWin') ICON='рф' LABEL='RU';;
esac

sketchybar --set $NAME icon="$ICON" label="$LABEL"
