// CS275
// Lucia Carrera
// Swift Assignment #4
import UIKit

/* EXAMPLE FUNCTION */
// function that will take an array of integers and return an array of just the positive integers from the original array
func positivesOnly(_ intArr: [Int]) -> [Int] {
    
    // filter will only adds the numbers that are bigger than zero to the array
    // this is done through the closure {}
    // $0 stands for current item
    let r = intArr.filter { $0 > 0 }
    
    // returns the new array
    return r
}

/* FUNCTION #1 */
// converts all characters in all strings in the input array to lower case
func toLower(_ stringArr: [String]) -> [String] {
    
    // transforms each element of an array to a new value, in this case into the same string but with its characters
    // in lowercase
    let s = stringArr.map({i in i.lowercased()})
    return s
}

/* FUNCTION #2 */
// add together each of the strings in the input array that can be converted // to an integer and return the sum
// use map(_:) and reduce(_:_:)
func addInts(_ stringArr: [String]) -> Int {
    
    // map transforms each element of the string array into an int, if they cannot be transformed through the Int() function
    // they will become a nil, additional code (?? 0) has been placed so that if nil map will transform it into zero
    let s = stringArr.map{ Int($0) ?? 0}
    
    // reduce will add up all the values of the previous integer array and display as one int
    let rtnval = s.reduce(0, { i, j in i + j})
    return rtnval
}

/* FUNCTION #3 */
// add the absolute values of the entries in intArr and return the sum
func addMagnitudes(_ intArr: [Int]) -> Int {
    
    // map transforms ints in array to their absolute value
    let s = intArr.map {i in abs(i)}
    
    // reduce sums up the values in array with base 0 into one int
    let rtnval = s.reduce(0, { i, j in i + j})
    return rtnval
}

/* FUNCTION #4 */
// add together the positive values from the input array and return the sum
func addPositives(_ intArr: [Int]) -> Int {

    // filter only adds the positive numbers into a new array
    let s = intArr.filter({$0 > 0})
    
    // reduce adds up the numbers in array
    let rtnval = s.reduce(0, { i, j in i + j})
    return rtnval
}

/* FUNCTION #5 */
 // concatenate the entries--without a space--in the input array and return the result
 func smashTogether(_ stringArr: [String]) -> String {
    
    // reduce adds all the strings in array together
    let s = stringArr.reduce("", { i, j in i + j})
    return s
 }

/* FUNCTION #6 */
// count the number of even integers and odd integers
// in the input array return the result as a named tuple
func evensOdds(_ intArr: [Int]) -> (evens: Int, odds: Int) {

    // for readability I've tried out two methods, first one is doing it step by step, first filtering out the odd numbers
    // and then counting how many odd numbers there are
    let oddNums = intArr.filter{i in i % 2 != 0}
    
    // for the evens I did it all together, it works either way although I would prefer the first way as it is much easier to understand
    // and we do not have a shortage of variables
    let evens = (intArr.filter{i in i % 2 == 0}).reduce(0,{ i,j in i + 1 })
    let odds = oddNums.reduce(0,{ i, j in i + 1 })

    // I suppose you could also do it directly into a tuple, but I prefer doing it step by step because I will not be able to understand
    // it in the future if it is all smashed together in one line
    return (evens, odds)
}


/* FUNCTION #7 */
// function that takes a set of strings, sends
func inSet(set: Set<String>) -> (String) -> Bool {
    
    // checks each item of second set to see if equal to string and returns true if it appears, false if not
    func f(_ e: String) -> Bool {
        return set.contains(e)
    }
    
    // returns true or false
    return f
}

// the checker stands for the function that will check the items in set, in the testing part inSet was chosen (function above)
func listIntersection(_ setOne: Set<String>, with checker: (String) -> Bool) -> Set<String> {
    
    // filter sends each item of setOne into the checker function specified in the argument and if true adds them to return array
    let rtnval = setOne.filter{checker($0)}
    return rtnval
}

// the checker stands for the function that will check the items in set, in the testing part inSet was chosen (function above)
func listDifference(_ setOne: Set<String>, with checker: (String) -> Bool) -> Set<String> {
    
    // filter sends each item of set into the checker function specified in the argument and if FALSE adds them to return array
    let rtnval = setOne.filter{!checker($0)}
    return rtnval
}

/* GRADUATE FUNCTION #1 */
// Rewrite evensOdds(_:) to use an inline closure.
// count the number of even integers and odd integers
// in the input array return the result as a named tuple
func evensOdds2(_ intArr: [Int]) -> (evens: Int, odds: Int) {

    return (evens: (intArr.filter{i in i % 2 == 0}).reduce(0,{ i,j in i + 1 }), (intArr.filter{i in i % 2 != 0}).reduce(0,{ i,j in i + 1 }))
}



/* GRADUATE FUNCTION #2 */
func makeSieve(for val: Int) -> (Int) -> Bool{
    
    return isMarked
}
// sieveOfEratosthenes(100, makeSieve: makeSieve)
func sieveOfEratosthenes(_ n: Int, makeSieve: (Int) -> (Int) -> Bool) -> [Int]{
    let rtnArr = [2...n]
    makeSieve
    return rtnArr
}



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
print(smashTogether(s5))

// testing for function #6
let s6 = 0...10
print(evensOdds(Array(s6)))

// testing for function #7
let myGroceries: Set = ["bugles", "beer", "carrots", "tapenade", "black licorice"]
let wifeGroceries: Set = ["carrots", "bugles", "mushrooms", "mayonnaise"]
print(listIntersection(myGroceries, with: inSet(set: wifeGroceries)))
print(listDifference(myGroceries, with: inSet(set: wifeGroceries)))

// testing for graduate function #1
let s8 = 0...10
print(evensOdds2(Array(s8)))

// testing for graduate function #2
print(sieveOfEratosthenes(100, makeSieve: makeSieve))
