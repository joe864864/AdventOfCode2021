#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/1/2022

#Read in data
$inputs = Get-Content "Day 3 - Input.txt"

$O = $inputs
$OTemp = @()

#Loop through each bit in a line
for($n=0; $n -lt $O[0].Length; $n++){

    #Arrays used to hold uses number of uses of 1,0 base on bit posotion
    $num1s = @()
    $num0s = @()

    #Build arrays with current number of place holders
    for($x=0; $x -lt $O[0].Length; $x++){
        $num1s += 0
        $num0s += 0
    }

    #Loop through each line of input
    foreach($i in $O){
        #Loop through each bit in a line
        for($x=0; $x -lt $i.Length; $x++){
            #add bit to number of 1s array by position
            $num1s[$x] += [convert]::ToInt32($i[$x],10)
        }
    }

    #Get the inverse of num1s array for 0's array
    for($x=0; $x -lt $num1s.Length; $x++){
        $num0s[$x] = $O.Length - $num1s[$x]
    }

    Write-Host($num1s)
    Write-Host($num0s)

    $mostCommon = $null
    $leastCommon = $null


    foreach($i in $num1s){
        if($i -ge $O.Length/2){
            $mostCommon += "1"
            $leastCommon += "0"
        }
        else{
            $mostCommon += "0"
            $leastCommon += "1"
        }
    }

    Write-Host("mostCommon: " + $mostCommon)
    Write-Host("leastCommon: " + $leastCommon)

    #Loop through each line of input
    foreach($i in $O){
        #if most common bit matches current line bit, save
        if($mostCommon[$n] -eq $i[$n]){
            $OTemp += $i
        }
    }
    $O = $OTemp
    $OTemp = @()
    if($O.Length -eq 1){
        $n = $num1s.Length
    }
}

$CO2 = $inputs
$CO2Temp = @()

#Loop through each bit in a line
for($n=0; $n -lt $CO2[0].Length; $n++){

    #Arrays used to hold uses number of uses of 1,0 base on bit posotion
    $num1s = @()
    $num0s = @()

    #Build arrays with current number of place holders
    for($x=0; $x -lt $CO2[0].Length; $x++){
        $num1s += 0
        $num0s += 0
    }

    #Loop through each line of input
    foreach($i in $CO2){
        #Loop through each bit in a line
        for($x=0; $x -lt $i.Length; $x++){
            #add bit to number of 1s array by position
            $num1s[$x] += [convert]::ToInt32($i[$x],10)
        }
    }

    #Get the inverse of num1s array for 0's array
    for($x=0; $x -lt $num1s.Length; $x++){
        $num0s[$x] = $CO2.Length - $num1s[$x]
    }

    Write-Host($num1s)
    Write-Host($num0s)

    $mostCommon = $null
    $leastCommon = $null


    foreach($i in $num1s){
        if($i -ge $CO2.Length/2){
            $mostCommon += "1"
            $leastCommon += "0"
        }
        else{
            $mostCommon += "0"
            $leastCommon += "1"
        }
    }

    Write-Host("mostCommon: " + $mostCommon)
    Write-Host("leastCommon: " + $leastCommon)

    #Loop through each line of input
    foreach($i in $CO2){
        #if most common bit matches current line bit, save
        if($leastCommon[$n] -eq $i[$n]){
            $CO2Temp += $i
        }
    }
    $CO2 = $CO2Temp
    $CO2Temp = @()
    if($CO2.Length -eq 1){
        $n = $num1s.Length
    }
}

Write-Host("Oxygen: " + $O)
Write-Host("CO2: " + $CO2)
Write-Host("Oxygen: " + [convert]::ToInt32($O,2))
Write-Host("CO2: " + [convert]::ToInt32($CO2,2))
$lifeSupport = [convert]::ToInt32($O,2) * [convert]::ToInt32($CO2,2)
Write-Host("Power: " + $lifeSupport)


