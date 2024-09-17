set nums {16 25 36 49}
set str "#"
set hash "#"

for {set i 0} {$i < 30} {incr i} {
     append str $hash
}
puts $str

foreach num $nums {
    
    puts "[expr sqrt($num)]    $num   [expr $num**2] \t [expr $num**3]"
}
set str2 "#"


for {set i 0} {$i < 30} {incr i} {
      append hash $str2
}
puts $hash