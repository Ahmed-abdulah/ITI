set num 7
set mul 1
while {1} {
    if {$mul==4} {
        incr mul
        continue
    }
    puts [expr $mul * $num]
    incr mul
    if {$mul==10} {
        break
    }
}