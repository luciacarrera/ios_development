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

var str = ""
var start = middle
var end = middle
for i in 1...length{
    for j in 1...length{
        if j < start || j > end{
            str += " "
        }else if j > start && j < end{
            str += "-"
        }else{
            str += "X"
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

// Cheatsheet for keyboard: ><{}|@#~€
