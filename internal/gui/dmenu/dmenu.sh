#!/bin/bash
nf="#fafafa"
nb="#0a0a0a"
sf="#fafafa"
sb="#d70000"
fn="Terminus (TTF)-9px3P3Ppx"
exe="$(dmenu_path | dmenu_run -b -i -nb "$nb" -nf "$nf" -sb "$sb" -sf "$sf" -fn "$fn")" && { eval "exec $exe";} && { exit ${?};}
