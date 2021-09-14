// CS275
// Lucia Carrera
// iOS Assignment #1

import UIKit

/* FIZZ BUZZ */
let nums = Array(1...50)
var result: String = ""

for num in nums{
    if num % 3 != 0 && num % 5 != 0{
        result = result + " " + String(num)
    }else{

        if num % 3 == 0{
            result += " FIZZ"
        }

        if num % 5 == 0{
            result += " BUZZ"
        }
    }

    if num != nums[nums.count-1]{
        result += ","
    }
}
result += "\nDone."

print(result)

// space between exercises
print()


/* FIRST PATTERN */
let length: Int = 9
let middle = Int(length/2)+1
let outerDiamond = " "
let innerDiamond = "-"
let borderDiamond = "X"

var str = ""
var start = middle
var end = middle
for i in 1...length{
    for j in 1...length{
        if j < start || j > end{
            str += outerDiamond
        }else if j > start && j < end{
            str += innerDiamond
        }else{
            str += borderDiamond
        }
    }
    print(str)
    str = ""
    
    if(i < middle){
        start-=1
        end+=1
    }else{
        start+=1
        end-=1
    }
}

// space between exercises
print()

/* CHESSBOARD */
let rows = 8
let cols = 10
let square1 = "X"
let square2 = " "

for current_row in 0...rows{
    str = ""
    for i in 1...cols{
        str += "+-"
        if i == cols{
            str += "+"
        }
    }
    str += "\n"

    if current_row != rows{
        var pattern = ""
        if(current_row % 2 == 0){
            pattern = "|" + square1 + "|" + square2
        }else{
            pattern = "|" + square2 + "|" + square1
        }
        for _ in stride(from: 1, to: cols, by: 2){
            str += pattern
        }
        str += "|"
        }
    print(str)
    str = ""
}
// Cheatsheet for keyboard: ><{}|@#~€
