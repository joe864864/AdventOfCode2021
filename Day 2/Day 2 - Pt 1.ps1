#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/1/2022

#Read through the data counting increase and decreases in depth
$inputs = Get-Content "Day 2 - Input.txt"

$x = 0
$y = 0

foreach($i in $inputs){

    $instructions = $i.split(" ", 2)
    if($instructions[0] -like "forward"){
        $x = $x + [int]$instructions[1]
    }
    elseif($instructions[0] -like "up"){
        $y = $y - [int]$instructions[1]
    }
    elseif($instructions[0] -like "down"){
        $y = $y + [int]$instructions[1]
    }
}

$multi = $x * $y

Write-Host("Horizontal (X): " + $x)
Write-Host("Depth (Y): " + $y)
Write-Host("Multi: " + $multi)