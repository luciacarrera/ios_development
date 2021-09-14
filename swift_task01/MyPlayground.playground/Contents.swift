// CS275
// Lucia Carrera
// iOS Assignment #1

import UIKit

/* FIZZ BUZZ */
// Description: Algorithmn that checks if range of numbers is divisible by two numbers, printing out FIZZ or BUZZ or both.
// Comments: I know you can do the FIZZ BUZZ part with only two ifs but the spacing if divisible by 5 and 3 wasn't right.
// I think this is the best solution without over complicating oneself to minimize code

// Constants are range of numbers to check if divisible, and divisors
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


/* FIRST PATTERN */
// Description: Algorithmn to print out pattern with a diamond like shape.
// Constants length, middle (created for readability) and characters to be used in pattern.
let length: Int = 9 // must be odd number
let middle = Int(length/2)+1
let outerDiamond = " "
let innerDiamond = "-"
let borderDiamond = "X"

// Initialization and declaration of string to print out
var result2 = ""
// Variable created to indicate when to print out certain characters(outer, border and innerDiamond)
var start = middle

// for loop to print out each row of pattern
for i in 1...length{
    
    // for loop to print out the specific element of each column in pattern
    for j in 1...length{
        
        // constant created for readibility, not actually necessary
        let end = length - start + 1
        
        // conditions for specific elements
        if j < start || j > end{
            result2 += outerDiamond
        }else if j > start && j < end{
            result2 += innerDiamond
        }else{
            result2 += borderDiamond
        }
    }
    // prints row
    print(result2)
    
    // resets var str for next row
    result2 = ""
    
    // Depending on half of the diamond the current row is in,
    // vars start will either increment or decrement
    if(i < middle){
        start-=1
    }else{
        start+=1
    }
}


/* new line between exercises */
print()


/* CHESSBOARD */
// Description: Chessboard pattern created with ASCII characters

// Constants indicating number of rows and cols in chessboard (in case someone wanted a rectangular chessboard)
// Also characters to be placed in the the white and black squares (denominated square1 and square2)
let rows = 8
let cols = 10
let square1 = " "
let square2 = "X"

// string to print (new name because we used str in first pattern)
var result3 = ""
// for loop to print out each row un chessboard
for current_row in 0...rows{
    
    // creates horizontal border of squares
    for i in 1...cols{
        result3 += "+-"
        if i == cols{
            result3 += "+"
        }
    }
    
    // algorithm prints out each rows upper horizontal border + the inside of the squares
    result3 += "\n"

    // if statement to be able to print out final lower horizontal border with nothing else
    if current_row != rows{
        
        // variable pattern varies depending on even or odd row
        var pattern = ""
        if(current_row % 2 == 0){
            pattern = "|" + square1 + "|" + square2
        }else{
            pattern = "|" + square2 + "|" + square1
        }
        
        // for loop to print out correct pattern for the inside of the squares
        for _ in stride(from: 1, to: cols, by: 2){
            result3 += pattern
        }
        
        //final vertical border of row
        result3 += "|"
        }
    
    // prints upper horizontal border + inside of square of one row
    print(result3)
    
    //resets string result
    result3 = ""
    
}


/* new line between exercises */
print()


/* BABYLONIAN METHOD */
// Description: Algorithmn to get best approximation of square root of a number
let num : Double = 3

var incumbent = Double(num / 2)
var iteration = 0
var result4: Double = -3.444

func finished(sqrtOf: Double, sqrtValue: Double) -> Bool{
    var isfinished = true
    
    if abs(sqrtValue*sqrtValue - sqrtOf) < sqrtOf * pow(10,-8){
        isfinished  = false
    }
    
    return isfinished
}

while finished(sqrtOf: num, sqrtValue: incumbent){
    result4 = abs(incumbent*incumbent - num ) / num
    
    print("Iteration ",iteration,": ")
    print("\t Value of si = ", incumbent)
    print("\t Value of |(s_i)^2 − x|/x= ", result4,"\n")
    
    // realize I could do it without
    var successor = (incumbent + num / incumbent) / 2
    incumbent = successor
    iteration += 1
}


// Cheatsheet for keyboard: ><{}|@#~€
