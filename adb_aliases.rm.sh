alias f1='for i in {1..100}; do adb -s 15798174540099O shell "input tap 500 500 && input tap 900 500 && input tap 900 500 && input tap 1204 540 && input tap 1500 500 && input tap 1900 500" ; done'
alias duck1_mc="adb  -s 15798174540099O shell input tap 250 900 && sleep 0.1 && adb  -s 15798174540099O shell input tap 250 900"
alias run1="adb -s 15798174540099O shell input tap 250 700 && sleep 0.1 && adb -s 15798174540099O shell input swipe 250 700 250 700 30000"
alias fff='for i in {1..100}; do adb -s 15798174540099O shell "input tap 500 500 && input tap 900 500 && input tap 900 500 && input tap 1204 540 && in
put tap 1500 500 && input tap 1900 500" ; done'
alias s180="adb -s 15798174540099O shell input swipe 700 500 1350 500 500"
alias run6="adb -s 15798174540099O shell input tap 250 700 && sleep 0.1 && adb -s 15798174540099O shell input swipe 250 700 250 700 6000"
run_first() {
  local DURATION=${1:-6000}  # Default to 6000ms if no argument is given
  adb -s 15798174540099O shell input tap 250 700
  sleep 0.1
  adb -s 15798174540099O shell input swipe 250 700 250 700 "$DURATION"
}
