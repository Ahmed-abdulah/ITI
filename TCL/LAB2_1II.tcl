set list1 {s a m y}
set list2 {s a y e d}

set len1 [llength $list1]
set len2 [llength $list2]

for {set i 0} {$i < $len1 && $i < $len2} {incr i} {
    set char1 [lindex $list1 $i]
    set char2 [lindex $list2 $i]
    
    if {$char1 != $char2} {
        set result [string compare $char1 $char2]
        break
    }
}
if {$result == 0} {
    set result [expr {$len1 - $len2}]
}

if {$result < 0} {
    puts "Samy preceeds"
} elseif {$result > 0} {
    puts "Sayed preceeds"
} else {
    puts "The same"
}
