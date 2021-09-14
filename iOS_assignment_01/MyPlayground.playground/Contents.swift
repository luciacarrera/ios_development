import UIKit

// FIZZ BUZZ
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

print()

// First pattern (must be uneven num)
let rows: Int = 9
let middle = rows/2

var dashes = 0

for i in 0...rows{
    var str = "X"
    if dashes != 0{
        for _ in 1...dashes{
            str += "-"
        }
        str += "X"
    }
    if( i >= middle){
        dashes-=1
    }else{
        dashes+=1
    }
    print(str)
}
