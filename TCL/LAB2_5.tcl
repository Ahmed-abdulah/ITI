proc insert {lst item {index 0}} {
    return [linsert $lst $index $item]
}

set colors {orange blue red}
puts $colors

set colors [insert $colors "yellow" 2]
puts $colors


proc replace {lst item {index 0}} {
    return [lreplace $lst $index $index $item]
}
set colors {orange blue red}
puts $colors
set colors [replace $colors "brown" 2]
puts $colors
