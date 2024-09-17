set str "DIC Intake 43"
set list [split $str]
puts [llength $list]

puts "$list"
set str2 ""
foreach ele $list {
    append str2 $ele
    append str2 " "
}
puts [string length $str2]
puts $str2
