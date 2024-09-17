set lst {0 0 1 1 2 2 3 3}
set list_of_lists {}

for {set i 0} {$i < [llength $lst]} {incr i 2} {
   set sub [list [lindex $lst $i] [lindex $lst [expr {$i + 1}]]]
   lappend list_of_lists $sub
} 
puts $list_of_lists

