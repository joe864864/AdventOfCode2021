#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/1/2022

#Read through the data counting increase and decreases in depth
$inputs = Get-Content "Day 3 - Input.txt"

$num1s = @()
$num0s = @()

for($n=0; $n -lt $inputs[0].Length; $n++){
    $num1s += 0
    $num0s += 0
}

foreach($i in $inputs){
    for($n=0; $n -lt $i.Length; $n++){
        $num1s[$n] += [convert]::ToInt32($i[$n],10)
    }
}

for($n=0; $n -lt $num1s.Length; $n++){
    $num0s[$n] = $inputs.Length - $num1s[$n]
}

Write-Host($num1s)
Write-Host($num0s)

$gamma = $null
$epsilon = $null


foreach($i in $num1s){
    if($i -gt $inputs.Length/2){
        $gamma += "1"
        $epsilon += "0"
    }
    else{
        $gamma += "0"
        $epsilon += "1"
    }
}

Write-Host("Gamma: " + $gamma)
Write-Host("Epsilon: " + $epsilon)
Write-Host("Gamma: " + [convert]::ToInt32($gamma,2))
Write-Host("Epsilon: " + [convert]::ToInt32($epsilon,2))
$power = [convert]::ToInt32($gamma,2) * [convert]::ToInt32($epsilon,2)
Write-Host("Power: " + $power)

