# function transfer() {
#   curl --progress-bar --upload-file "$1" "https://transfer.sh/$(basename $1)" |\
#       tee /dev/null
# }

function html-minifier() {
  html-minifier \
      --use-short-doctype \
      --sort-attributes \
      --sort-class-name \
      --collapse-whitespace \
      --remove-script-type-attributes \
      --remove-style-link-type-attributes \
      --remove-comments \
      --minify-css "" \
      --minify-js "" \
      --html5 \
      "$1";}

function js-minifier-safe() {
  uglifyjs \
      --ie8 \
      --keep-fnames \
      --compress "drop_console=true,\
                  sequences=true,\
                  properties=true,\
                  drop_debugger=true,\
                  conditionals=true,\
                  comparisons=true,\
                  evaluate=true,\
                  booleans=true,\
                  loops=true,\
                  unused=true,\
                  hoist_funs=true,\
                  hoist_vars=true,\
                  if_return=true,\
                  join_vars=true,\
                  cascade=true,\
                  warnings=true" \
      "$1";}

function js-minifier() {
  uglifyjs \
      --mangle \
      --compress "drop_console=true,\
                  sequences=true,\
                  properties=true,\
                  drop_debugger=true,\
                  conditionals=true,\
                  comparisons=true,\
                  evaluate=true,\
                  booleans=true,\
                  loops=true,\
                  unused=true,\
                  hoist_funs=true,\
                  hoist_vars=true,\
                  if_return=true,\
                  join_vars=true,\
                  cascade=true,\
                  warnings=true" \
      "$1";}

function encrypt() {
  keybase pgp encrypt -i "$1";}

function decrypt() {
  keybase pgp decrypt -i "$1";}

function ip() {
  curl -sL 'ipinfo.io';}

function gip() {
  curl --compressed -sL "http://www.geoiptool.com/en/?IP=$1" |\
      egrep -v 'marker_content' |\
      egrep 'marker_city|maker_country|marker_ip' |\
      grep -oP '(?<=\<div\>).*(?=\<\/div\>)' |\
      grep \:;}

function curlgrepdm() {
  local regx='https?://((\w|\d)+[./?=&;%-]*)+'
  curl -L "$1" | tac | tac | egrep -io "$regx" | sort -u;}

function curlgrepip() {
  local regx='([0-9]{,3}[.]){3}[0-9]{,3}'
  curl -L "$1" | tac | tac | egrep -oi "$regx" | sort -u;}

function curlgrepssl() {
  local server="$1"
  echo | openssl s_client -showcerts -servername "${server}" -connect "${server}:443" 2>/dev/null | openssl x509 -inform pem -noout -text;}

function sgn() {
  local signature="$(cat "$1" | sha512sum)"
  echo ${signature:0:10} > "$(basename "$1").sha512";}

function chk() {
  local f_name="$(basename "$1").sha512"
  [ -f "$f_name" ] && {
    local f_orig=$(sha512sum "$1" | cut -d" " -f1)
    local f_hash="$(cat "$f_name" | head -1 | awk '{print $0}')"
    local f_Hash=${f_orig:0:10}
    [[ $f_hash == $f_Hash ]] && {
      echo -e "\e[35m[\e[31m#\e[35m] \e[97mHash matched.\e[0m"
    }||{ echo -e "\e[35m[\e[31m!\e[35m] \e[97mHash mismatched.\e[0m";}
  }||{ echo -e '\e[35m[\e[31m#\e[35m] \e[97mHash src not found.\e[0m';};}

function xsgn() {
  echo $(cat "$1" | openssl dgst -sha256 -binary | openssl enc -base64 -A);}

function rsgn() {
  local signature="$(md5sum "$1" | awk '{print $1}')"
  local extension="$(echo "$1" | egrep -o '[.][a-z0-9]{3,}' | tail -1)"
  mv "$1" "${signature:0:10}$extension";}

function rchk() {
  local signature="$(md5sum "$1" | awk '{print $1}')"
  local extension="$(echo "$1" | egrep -o '[.][a-z0-9]{3,}' | tail -1)"
  local original=$(basename "$1")
  signature=${signature:0:10}
  original=${original:0:10}
  [[ $signature == $original ]] && {
    echo -e "\e[35m[\e[31m#\e[35m] \e[97mHash matched!\e[0m"
  }||{ echo -e "\e[35m[\e[31m!\e[35m] \e[97mHash mismatched -> $original.\e[0m";};}

function aptu() {
  local payload="
ZnVuY3Rpb24gaW5pdCgpIHsKICBsb2NhbCB1c2FnZT0iXGVbOTJtW1xlWzkxbSFcZVs5Mm1dXGVb
OTdtICQwIDxmbGFnPiA8dGFyZ2V0PlxlWzBtIgogIGxvY2FsIHF1ZXVlPSgKICAgICJ1cGRhdGUi
CiAgICAidXBncmFkZSIKICAgICJhdXRvcmVtb3ZlIgogICk7CgogIGZ1bmN0aW9uIHVzYWdlKCkK
ICB7IGVjaG8gLWUgIiR1c2FnZSImJmV4aXQgMTt9CgogIGZ1bmN0aW9uIHN0YXRlX2NoZWNrKCkK
ICB7IFsgIiQoL3Vzci9iaW4vaWQgLXUpIiAtbmUgMCBdfHxyZXR1cm4gJD87fQoKICBmdW5jdGlv
biBzdGF0ZV9raWxsKCkKICB7IHN0YXRlX2NoZWNrOyBbICQ/IC1uZSAwIF0mJnVzYWdlO30KCiAg
aWYgW1sgJChzdGF0ZV9raWxsOyBlY2hvICQ/KSAtZXEgMSBdXQogIHRoZW4KICAgICAgZm9yICgo
IGk9MDsgaTwkeyNxdWV1ZVtAXX07IGkrKyApKQogICAgICBkbwogICAgICAgIHN1ZG8gYXB0ICR7
cXVldWVbaV19CiAgICAgIGRvbmUKICBmaQp9O2luaXQ="
  bash -c "$(echo -n "$payload" | tr -d '\n' | tr -d ' ' | base64 -d)";}

function gfd() {
  local payload="
ZnJvbSB1cmxsaWIgaW1wb3J0IHVybHJldHJpZXZlCmZyb20gb3MucGF0aCBpbXBvcnQgaXNmaWxl
LGlzZGlyCmZyb20gb3MgaW1wb3J0IHN5c3RlbSBhcyBmb3JrCmltcG9ydCByZXF1ZXN0cyx0YXJm
aWxlLHNodXRpbAoKY2xhc3MgR2V0T2JqZWN0KCk6CgogIGRlZiBfX2luaXRfXyhzZWxmKToKICAg
IHByaW50KCdbMC80XSBpbml0aWFsaXppbmcuLi4nKQogICAgc2VsZi5QSU5HICAgID0gImh0dHBz
Oi8vZG93bmxvYWQubW96aWxsYS5vcmcvIgogICAgc2VsZi5EVVJMICAgID0gImh0dHBzOi8vZG93
bmxvYWQubW96aWxsYS5vcmcvP3Byb2R1Y3Q9ZmlyZWZveC1kZXZlZGl0aW9uLWxhdGVzdC1zc2wm
b3M9bGludXg2NCZsYW5nPWVuLVVTIgogICAgc2VsZi5CX1BBVEggID0gIi90bXAvIiAgICAgICAg
ICMgYmFzZSBwYXRoCiAgICBzZWxmLkRfUEFUSCAgPSAiZmlyZWZveC1kZXYvIiAgIyBkZXYgcGF0
aAogICAgc2VsZi5GX05BTUUgID0gImZpcmVmb3giICAgICAgICMgZmlsZW5hbWUKICAgIHNlbGYu
Rl9FWFQgICA9ICIudGFyLmd6IiAgICAgICAjIGZpbGUgZXh0ZW5zaW9uCiAgZGVmIF9jaGVja1VS
TChzZWxmKToKICAgIHByaW50KCdbMS80XSBjaGVja2luZyBlbmRwb2ludC4uLicpCiAgICB0cnk6
CiAgICAgIGlmIDIwMCA9PSByZXF1ZXN0cy5nZXQoc2VsZi5QSU5HKS5zdGF0dXNfY29kZToKICAg
ICAgICBwcmludCgnPiBlbmRwb2ludCBpcyB1cCEnKQogICAgZXhjZXB0IEV4Y2VwdGlvbiBhcyBl
OgogICAgICBwcmludCgnPiBlbmRwb2ludCBpcyBkb3duLi4gOignKQogICAgICBleGl0CiAgZGVm
IF9jaGVja09iamVjdEV4aXN0cyhzZWxmKToKICAgIHByaW50KCdbMi80XSBjaGVja2luZyBpZiBv
YmplY3QgZXhpc3RzLi4uJykKICAgIGlmIGlzZmlsZShzZWxmLkJfUEFUSCtzZWxmLkZfTkFNRStz
ZWxmLkZfRVhUKToKICAgICAgcHJpbnQoJz4gb2JqZWN0IGV4aXN0cyEgU2tpcHBpbmcgIzMuJykK
ICAgIGVsc2U6CiAgICAgIHByaW50KCc+IG9iamVjdCBkb2VzblwndCBleGlzdC4uJykKICAgICAg
c2VsZi5fZG93bmxvYWRPYmplY3QoKQogIGRlZiBfZG93bmxvYWRPYmplY3Qoc2VsZik6CiAgICBw
cmludCgnWzMvNF0gZG93bmxvYWRpbmcgb2JqZWN0Li4uJykKICAgIHVybHJldHJpZXZlKHNlbGYu
RFVSTCxzZWxmLkJfUEFUSCtzZWxmLkZfTkFNRStzZWxmLkZfRVhUKQogIGRlZiBfZXh0cmFjdE9i
amVjdChzZWxmKToKICAgIHByaW50KCdbNC80XSBleHRyYWN0aW5nIG9iamVjdC4uLicpCiAgICBp
ZiBpc2RpcihzZWxmLkJfUEFUSCtzZWxmLkRfUEFUSCk6CiAgICAgIHByaW50KCc+IGNsZWFuaW5n
IGV4aXN0aW5nIGV4dHJhY3Rpb24uLi4nKQogICAgICBzaHV0aWwucm10cmVlKHNlbGYuQl9QQVRI
K3NlbGYuRF9QQVRIKQogICAgICBmb3JrKCdta2RpciAtcCAnK3NlbGYuQl9QQVRIK3NlbGYuRF9Q
QVRIKQogICAgaWYgdGFyZmlsZS5pc190YXJmaWxlKHNlbGYuQl9QQVRIK3NlbGYuRl9OQU1FK3Nl
bGYuRl9FWFQpOgogICAgICBwcmludCgnPiBleHRyYWN0aW5nIG9iamVjdC4uLicpCiAgICAgIHQ9
dGFyZmlsZS5vcGVuKHNlbGYuQl9QQVRIK3NlbGYuRl9OQU1FK3NlbGYuRl9FWFQsJ3InKQogICAg
ICB0LmV4dHJhY3RhbGwoc2VsZi5CX1BBVEgrc2VsZi5EX1BBVEgpCiAgICAgIHQuY2xvc2UoKQoK
aWYgX19uYW1lX18gPT0gJ19fbWFpbl9fJzoKICBvPUdldE9iamVjdCgpCiAgby5fY2hlY2tVUkwo
KQogIG8uX2NoZWNrT2JqZWN0RXhpc3RzKCkKICBvLl9leHRyYWN0T2JqZWN0KCkKICBwcmludCgn
KyBmaW5pc2hlZCEnKQo="
  deactivate && source ~/.lib/pyradox2/bin/activate
  [ -n "$(pip freeze | grep requests)" ] || pip install requests
  python -c "$(echo -n "$payload" | tr -d '\n' | tr -d ' ' | base64 -d)"
  deactivate && source ~/.lib/pyradox3/bin/activate
}