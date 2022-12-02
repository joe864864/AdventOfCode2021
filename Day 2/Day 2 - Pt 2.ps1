#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/1/2022

#Read through the data counting increase and decreases in depth
$inputs = Get-Content "Day 2 - Input.txt"

$x = 0
$y = 0
$aim = 0

foreach($i in $inputs){

    $instructions = $i.split(" ", 2)
    if($instructions[0] -like "forward"){
        $x = $x + [int]$instructions[1]
        $y = $y + ($aim * [int]$instructions[1])
    }
    elseif($instructions[0] -like "up"){
        $aim = $aim - [int]$instructions[1]
    }
    elseif($instructions[0] -like "down"){
        $aim = $aim + [int]$instructions[1]
    }
}

$multi = $x * $y

Write-Host("Horizontal (X): " + $x)
Write-Host("Depth (Y): " + $y)
Write-Host("Aim (aim): " + $aim)
Write-Host("Multi: " + $multi)