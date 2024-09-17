set file [open "inputfile.txt" r]
set data [read $file]
close $file
set outputFile [open "File_Handled.txt" w]
set lines [split $data \n]
puts $data
foreach line $lines {
    if {[regexp "Employee:*" $line]} {
        puts $outputFile $line
    } else {
        if {[regexp {^([^:]+):=(.{15})} $line ]} {
            puts $outputFile 
        } else {
            puts $outputFile $line
        }
    }
}



