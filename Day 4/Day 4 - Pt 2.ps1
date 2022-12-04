#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/4/2022

#Read through the data counting increase and decreases in depth
$data = Get-Content "Day 4 - Input.txt"

#Read in winning WinNumbers in to an array
$WinNumbers = $data[0].Split(",")

Write-Host("Winning WinNumbers: " + $WinNumbers)

$BoardArray = @()
$calledNumArray = @()

#building board array, removing extra spaces
for($line = 1; $line -lt $data.Length; $line++){
    if($data[$line] -eq ""){

    }
    else{
        $lineArray = $data[$line]

        $BoardArray += [int]($lineArray[0] + $lineArray[1])
        $BoardArray += [int]($lineArray[3] + $lineArray[4])
        $BoardArray += [int]($lineArray[6] + $lineArray[7])
        $BoardArray += [int]($lineArray[9] + $lineArray[10])
        $BoardArray += [int]($lineArray[12] + $lineArray[13])

        #$BoardArray += @($data[$line].Split(" "))
    }
}

foreach($n in $BoardArray){
    $calledNumArray += 0
}

#Write-Host("num: " + $BoardArray)
#Write-Host("place: " + $calledNumArray)

$winningTable = 0
$lastNum = 0

$WinTables = @()

#build table to hold what boards have won
for($i=0;$i -lt [math]::floor($calledNumArray.Length/25); $i++){
    $WinTables += 0
}

for($n = 0; $n -lt $WinNumbers.Length;$n++){

    #Write-Host("num: " + $BoardArray)
    #Write-Host("place: " + $calledNumArray)

    $lastNum = $WinNumbers[$n]

    $sumx = 0
    $sumy = 0

    #Marks winning numbers
    for($i = 0; $i -lt $BoardArray.Length;$i++){
        if($WinNumbers[$n] -eq $BoardArray[$i]){
            $calledNumArray[$i] = 1
        }
    }
    #Logic to test win case horizontal
    for($i = 0; $i -lt $calledNumArray.Length;$i+=5){
        $sumx = $calledNumArray[$i] + $calledNumArray[$i+1] + $calledNumArray[$i+2] + $calledNumArray[$i+3] + $calledNumArray[$i+4]
        if($sumx -eq 5){
            $WinTables[([math]::floor($i/25))] = 1
            #$winningTable = [math]::floor($i/25)
            #Write-Host("Horizontal winner in winningTable: " + $winningTable)
            #$n = $WinNumbers.Length
        }
        $sum = 0
        for($r=0;$r -lt $WinTables.Length;$r++){
            $sum += $WinTables[$r]
        }
        if($sum -eq $WinTables.Length){
            $WinTables[([math]::floor($i/25))] = 0
            $n = $WinNumbers.Length
        }
    }
    #Logic to test win case vertical
    #looking fo sum of 5 in with 25 set with multiple of 5
    for($i = 0; $i -lt $calledNumArray.Length;$i+=25){
        for($x = $i; $x -lt $i+5;$x++){
            $sumy = $calledNumArray[$x] + $calledNumArray[$x+5] + $calledNumArray[$x+10] + $calledNumArray[$x+15] + $calledNumArray[$x+20]
            if($sumy -eq 5){
                $WinTables[([math]::floor($i/25))] = 1
                #$winningTable = [math]::floor($i/25)
                #Write-Host("Verticle winner in winningTable: " + $winningTable)
                #$i = $calledNumArray.Length
                #$n = $WinNumbers.Length
            }
            $sum = 0
            for($r=0;$r -lt $WinTables.Length;$r++){
                $sum += $WinTables[$r]
            }
            if($sum -eq $WinTables.Length){
                $WinTables[([math]::floor($i/25))] = 0
                $i = $calledNumArray.Length
                $n = $WinNumbers.Length
            }
        }
    }
}


#Visual Output
for($i=0;$i -lt $BoardArray.Length;$i+=5){
    if($i%25 -eq 0){
        Write-Host("Table: " + $i/25)
    }
    #Write-Host([string]$BoardArray[$i] + " " + [string]$BoardArray[$i+1] + " " + [string]$BoardArray[$i+2] + " " + [string]$BoardArray[$i+3] + " " + [string]$BoardArray[$i+4])
    Write-Host([string]$calledNumArray[$i] + " " + [string]$calledNumArray[$i+1] + " " + [string]$calledNumArray[$i+2] + " " + [string]$calledNumArray[$i+3] + " " + [string]$calledNumArray[$i+4])
}


#Calculate points



$points = 0

#
for($i=0;$i -lt $WinTables.Length; $i++){
    if($WinTables[$i] -eq 0){
        $winningTable = $i
    }
}

Write-Host("Last table: " + $winningTable)

for($i = $winningTable*25; $i -lt $winningTable*25+25;$i++){
    if($calledNumArray[$i] -eq 0){
        $points += $BoardArray[$i]
    }
}
$points = $points * $lastNum
Write-Host("Winning Num:" + $lastNum)
Write-Host("Points:" + $points)
