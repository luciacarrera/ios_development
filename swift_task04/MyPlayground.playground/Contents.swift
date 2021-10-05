// CS275
// Lucia Carrera
// Swift Assignment #4
import UIKit

/* EXAMPLE FUNCTION */
// function that will take an array of integers and return an array of just the positive integers from the original array
func positivesOnly(_ intArr: [Int]) -> [Int] {
    let r = intArr.filter { $0 > 0 }
    return r
}

/* FUNCTION #1 */
// converts all characters in all strings in the input array to lower case
func toLower(_ stringArr: [String]) -> [String] {
    let s = stringArr.map({i in i.lowercased()})
    return s
}

/* FUNCTION #2 */
// add together each of the strings in the input array that can be converted // to an integer and return the sum
// use map(_:) and reduce(_:_:)
func addInts(_ stringArr: [String]) -> Int {
    let s = stringArr.map{ Int($0) ?? 0}
    let rtnval = s.reduce(0, { i, j in i + j})
    return rtnval
}

/* FUNCTION #3 */
// add the absolute values of the entries in intArr and return the sum
func addMagnitudes(_ intArr: [Int]) -> Int {
    let s = intArr.map( {i in abs(i)})
    let rtnval = s.reduce(0, { i, j in i + j})
    return rtnval
}

/* FUNCTION #4 */
// add together the positive values from the input array and return the sum
func addPositives(_ intArr: [Int]) -> Int {

    let s = intArr.filter({$0 > 0})
    let rtnval = s.reduce(0, { i, j in i + j})
    return rtnval
}

/* FUNCTION #5 */
 // concatenate the entries--without a space--in the input array and return the result
 func concat(_ stringArr: [String]) -> String {
    let s = stringArr.reduce("", { i, j in i + j})
    return s
 }

/* FUNCTION #6 */
// count the number of even integers and odd integers
// in the input array return the result as a named tuple
func evensOdds(_ intArr: [Int]) -> (evens: Int, odds: Int) {
    // here, I’m not specifying how to write the function
    // but you do need to use reduce(_:_:)
    // and you can choose to use an auxiliary function instead of an inline closure

    let evenNums = intArr.filter({i in i % 2 == 0})
    let oddNums = intArr.filter({i in i % 2 != 0})

    let evens = evenNums.reduce(0,{ i,j in i + 1 })
    let odds = oddNums.reduce(0,{ i, j in i + 1 })

    return (evens, odds)
}


/* FUNCTION #7 */
/* FUNCTION # */


/* TESTING FUNCTIONS */
// testing example function
let ints = [5, -9, 0, 23, 2, -7, 5, -1]
print("positives are: \(positivesOnly(ints))")

// testing for function #1
let s1 = ["Now", "is", "THE", "tImE"]
print(toLower(s1))
["now", "is", "the", "time"]

// testing for function #2
let s2 = ["0", "one", "2", "three", "4ff", "5", "six", "Seven", "8", "0"]
print(addInts(s2))

//testing for function #3
let s3 = [0, 1, -1, 2, -2, 3, -3, 4, -4]
print(addMagnitudes(s3))

// testing for function #4
let s4 = [0, 1, -1, 2, -2, 3, -3, 4, -4]
print(addPositives(s4))

// testing for function #5
let s5 = ["a", "man", "a", "plan", "a", "canal", "panama"]
print(concat(s5))

// testing for function #6
let s6 = 0...10
print(evensOdds(Array(s6)))

// testing for function #7


