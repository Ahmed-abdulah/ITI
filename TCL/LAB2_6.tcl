proc add {a {b 5}} {
return [expr $a+$b]
5}
proc sub {a {b 5}} {
return [expr $a-$b]
}
proc mul {a {b 5}} {
return [expr $a*$b]
}
proc div {a {b 5}} {
if {$b!=0} {
    return [expr $a/$b]
} else {
    return "INVALID ARGUMENTS"
}
}

puts [add {10}]
puts [sub {10}]
puts [mul {10}]
puts [div {10}]