// CS275
// Lucia Carrera
// Swift Assignment #5

import UIKit

/* PALINDROME FUNCTION */
// function that takes a string and checks if it is a palindrome (ignoring spaces and punctuation)
func isPalindrome(_ s: String) -> Bool{
    // empty string returns false
    if(s == ""){
        return false
    }
    
    // first remove spaces and punctuation
    var myStr = s.filter({i in !i.isPunctuation})
    
    // remove whitespaces
    myStr = myStr.filter({i in i != " " })

    //make lowercase
    myStr = myStr.lowercased()

    // check if palindrome
    // get string length
    let strLength = myStr.count
    
    // loop until integer division of string length /2 (if odd number of letters still palindrome -> sos)
    for i in 0...Int(strLength/2){
        
    // constant of chars to compare from each half of string
    let startChar = Array(myStr)[i]
    let endChar = Array(myStr)[strLength - 1 - i]
        
        // if not equal then immediately return
        if (startChar != endChar){
            return false
        }
    }
    // if survived entire loop then it truly is a palindrome
    return true
}

/* TESTING */
print("\n\n-------------------------------\n TESTING FOR PALINDROME NORMAL\n-------------------------------")
// Array of cases for checking with nil case
var palindromeCases: Array<String> = [""]

// case with odd number palindrome
palindromeCases.append("lol")

// case with even number and capital letter
palindromeCases.append("KiihhiIk")

// case with punctuation
palindromeCases.append("K,iih!hiI.k")

// case with whitespaces + punctuation
palindromeCases.append("Madam, I’m Adam")

// untrue case #1
palindromeCases.append("Madame, I’m Adam")

// untrue case #2
palindromeCases.append("Nadam, I’m Adam")

// loop check
for palindrome in palindromeCases{
    if(isPalindrome(palindrome)){
        print("Palindrome: ",palindrome)
    }else{
        print("\nNot a palindrome: ",palindrome,"\n")
    }
}
// More checking
var morePalindromes: Array<String> = ["Mr. Owl ate my metal worm", "Do geese see God?", "Was it a car or a cat I saw?", "Murder for a jar of red rum", "Go hang a salami, I'm a lasagna hog", "Rats live on no evil star", "Live on time, emit no evil","Step on no pets"]

for palindrome in morePalindromes{
    if(isPalindrome(palindrome)){
        print("Palindrome: ",palindrome)
    }else{
        print("\nNot a palindrome: ",palindrome,"\n")
    }
}



/* STACK */
// stucture of a stack in swift (stack is like a cup where you put nodes one on top of the other)
// has lifo algorithmn (last in first out)
// not to be confused with queue
struct Stack<Element> {
    var items = [Element]()
    
    // puts node into stack (last place)
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    // removes last node from stack
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
}

// function to check if string is a palindrome by using a stack to compare
func isPalindromeStack(_ s: String) -> Bool{
    
    // REMOVING OF PUNCTUATION AND WHITESPACES AND UPPER CASE
    // I'm not sure if you wanted us to check if punctuation+ through stack
    // but as it is not specified I am going to save myself the trouble of thinking and programming
    // that and just use the closures which are easy. The comparison part is in stack as specified
    // I think to solve it like that we would just move curChar and push another one? would have to think about it thoroughly
    
    // empty string returns false
    if(s == ""){
        return false
    }
    
    // first remove spaces and punctuation
    var myStr = s.filter({i in !i.isPunctuation})
    
    // remove whitespaces
    myStr = myStr.filter({i in i != " " })

    //make lowercase
    myStr = myStr.lowercased()

    // STACK COMPARISON
    // string length and string half length (integer division) constants
    let strLen = myStr.count
    let strHalf = Int(strLen / 2)

    // current char variable to keep track
    var curChar = 0
    
    // create stack
    var stack = Stack<Character>()

    // push first half into stack
    while(curChar < strHalf){
        stack.push(Array(myStr)[curChar])
        curChar+=1
    }
    
    // check if odd length, if so ignore middle char
    if (strLen % 2 != 0){
        curChar+=1
    }
    
    // Comparison loop
    while(curChar < strLen){
        // constants of chars to compare
        let stackChar = stack.pop()
        let strChar = Array(myStr)[curChar]
        
        // print out chars that we will compare
        print("Comparing: ", stackChar, " & ",strChar)
        
        if(stackChar != strChar){
            return false
        }
        curChar+=1
    }
        
    // if survived loop then true
    return true
}


/* TESTING */
print("\n\n------------------------------\n TESTING FOR PALINDROME STACK\n------------------------------")
// loop check with same cases as in previous function
for palindrome in palindromeCases{
    if(isPalindromeStack(palindrome)){
        print("\nPalindrome: ",palindrome,"\n")
    }else{
        print("\nNot a palindrome: ",palindrome,"\n")
    }
}
// More checking
for palindrome in morePalindromes{
    if(isPalindromeStack(palindrome)){
        print("\nPalindrome: ",palindrome,"\n")
    }else{
        print("Not a palindrome: ",palindrome,"\n")
    }
}
