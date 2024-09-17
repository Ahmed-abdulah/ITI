set a [expr int(rand()*10)]
set b [expr int(rand()*10)]
puts $a
puts $b

if {$a > $b} {
    puts "a is greater than b"
} elseif {$b > $a} {
  puts "b is greater"  
} else {
    puts "two are equal"
}