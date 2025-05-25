#!/bin/bash

#
# Fill you inventory with pick axes, dig down, then run.
#
#
#
#
#
alias adb1="adb -s 15798174540099O"
adb1 shell input tap 250 900 && sleep 0.1 && adb1 shell input tap 250 900
function adb1 { adb -s 15798174540099O ; }
for i in {1..10}; do echo Key 'right bracket'; adb1 shell input keyevent KEYCODE_$(( i % 10 )) ; adb1 shell input keyevent SPACE ; adb1 shell input swipe 250 700 250 700 2000 ; echo look up, forward ; adb1 shell input keyevent 220, 51, 51, 51, SPACE ;adb1 shell input swipe 1200 800 1200 200 500 && sleep 0.1 && adb1 shell input swipe 1200 350 1200 600 20000 ; adb1 shell input keyevent SPACE ; adb1 shell input swipe 250 700 250 700 2000 ; echo settin inv $(( i % 10 )), $i of 10 done ; done
for i in $(seq 1 "$1"); do echo Key 'right bracket'; adb1 shell input keyevent KEYCODE_$(( i % 10 )) ; adb1 shell input keyevent SPACE ; adb1 shell input swipe 250 700 250 700 2000 ; echo look up, forward ; adb1 shell input keyevent 220, 51, 51, 51, SPACE ;adb1 shell input swipe 1200 800 1200 200 500 && sleep 0.1 && adb1 shell input swipe 1200 350 1200 600 20000 ; adb1 shell input keyevent SPACE ; adb1 shell input swipe 250 700 250 700 2000 ; echo settin inv $(( i % 10 )), $i of $1 done ; 
done
