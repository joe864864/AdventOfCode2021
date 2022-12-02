#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/1/2022

#Read through the data counting increase and decreases in depth
$depths = Get-Content "Day 1 - Input.txt"
#$depths = Get-Content "Day 1 - Test Input.txt"

$decreaseCount = 0
$increaseCount = 0
$equalCount = 0

$sums = @()

for($i=1; $i -lt $depths.Length-1; $i++){

    $sum = [int]$depths[$i-1] + [int]$depths[$i] + [int]$depths[$i+1]
    Write-Host("Summing - Past:" + [int]$depths[$i-1] + " Current:" + [int]$depths[$i] + " Next:" + [int]$depths[$i+1] + " Sum:" + $sum)
    $sums += $sum

}

for($i=1; $i -lt $sums.Length; $i++){

    #decrease
    if([int]$sums[$i] -lt [int]$sums[$i-1]){
        $decreaseCount++
        #Write-Host("Decrease")
    }
    #increase
    elseif([int]$sums[$i] -gt [int]$sums[$i-1]){
        $increaseCount++
        #Write-Host("Increase")
    }
    #equal
    elseif([int]$sums[$i] -eq [int]$sums[$i-1]){
        $equalCount++
        #Write-Host("Equal")
    }

}

Write-Host("Total increases: " + $increaseCount)
Write-Host("Total decreases: " + $decreaseCount)
Write-Host("Total equal: " + $equalCount)