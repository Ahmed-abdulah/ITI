set file [open "REPORT.txt" r]


set count 0

while {[gets $file line] != -1} {
    incr line_number
    if {[regexp {(slack|setup)} $line]} {
        puts  $line
        incr count
    }
}
puts "THE number of occurances is :$count"

close $file