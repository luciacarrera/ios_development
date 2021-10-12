func inSet(set: Set<String>) -> (String) -> Bool {
    func f(_ e: String) -> Bool {
    return set.contains(e)
    }
    return f
}

let nums = Array(1...50)
let divisor1 = 3
let divisor2 = 5

// Declaring resulting string
var result1: String = ""

// loop to go through range of numbers
for num in nums{
    
    // Checks if not divisible by
    if num % divisor1 != 0 && num % divisor2 != 0{
        result1 = result1 + String(num)
    }else{
        
        // Checks if NOT divisible by one or the other or if divisible by both
        if num % divisor1 != 0{
            result1 += "BUZZ"
        }else if num % divisor2 != 0{
            result1 += "FIZZ"
        }else{
            result1 += "FIZZ BUZZ"
        }
    }

    // Adds separators between numbers
    if num != nums[nums.count-1]{
        result1 += ", "
    }
}
// Indicates that all numbers in range have been checked
result1 += "\nDone."

// Prints result
print(result1)


/* new line between exercises */
print()
