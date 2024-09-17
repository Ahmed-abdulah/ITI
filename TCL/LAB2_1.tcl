set name1 "Samy"
set name2 "Sayed"
set res [string compare -nocase $name1 $name2]
puts $res
if {$res==0} {
    puts "They are same "
} elseif {$res==-1} {
    puts "$name2 preceeds"
} else {
    puts "$name1 preceeds"
}
