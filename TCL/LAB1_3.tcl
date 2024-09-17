set str "ABCDEF"

for {set i 0} {$i < [string length $str]} {incr i} {
    set char [string index $str $i]
    if {$char eq "A"} {
        puts "Excellent"
    } elseif {$char eq "B"} {
        puts "Very good"
    } elseif {$char eq "C"} {
        puts "Good"
    } elseif {$char eq "D"} {
        puts "Up normal"
    } elseif {$char eq "E"} {
        puts "Normal"
    } elseif {$char eq "F"} {
        puts "Bad"
    }
}
