#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/1/2022

#Read through the data counting increase and decreases in depth
$depths = Get-Content "Day 1 - Input.txt"
#$depths = Get-Content "Day 1 - Test Input.txt"

$decreaseCount = 0
$increaseCount = 0
$equalCount = 0

for($i=1; $i -lt $depths.Length; $i++){

    Write-Host("Comparing current: " + [int]$depths[$i] + " to past: " + [int]$depths[$i-1])
    if([int]$depths[$i] -lt [int]$depths[$i-1]){
        $decreaseCount++
        Write-Host("Decrease")
    }
    elseif([int]$depths[$i] -gt [int]$depths[$i-1]){
        $increaseCount++
        Write-Host("Increase")
    }
    elseif([int]$depths[$i] -eq [int]$depths[$i-1]){
        $equalCount++
        Write-Host("Equal")
    }

}

Write-Host("Total increases: " + $increaseCount)
Write-Host("Total decreases: " + $decreaseCount)
Write-Host("Total decreases: " + $equalCount)