set a 10
set b 5
    
    set add [expr {$a + $b}]
    puts "$a + $b = $add"

    set sub [expr {$a - $b}]
    puts "$a - $b = $sub"

    set mul [expr {$a * $b}]
    puts "$a * $b = $mul"

    if {$b != 0} {
        set div [expr {$a / $b}]
        puts "$a / $b = $div"
    } else {
        puts "Division by zero is not allowed."
    }

    set exp [expr {pow($a, $b)}]
    puts "$a ^ $b = $exp"

    if {$b != 0} {
        set rem [expr {$a % $b}]
        puts "$a % $b = $rem"
    } else {
        puts "Remainder by zero is not allowed."
    }

    set shl [expr {$a << $b}]
    puts "$a << $b = $shl"

    set shr [expr {$a >> $b}]
    puts "$a >> $b = $shr"


