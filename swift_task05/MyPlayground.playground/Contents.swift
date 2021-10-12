// CS275
// Lucia Carrera
// Swift Assignment #5

import UIKit

/* PALINDROME FUNCTION */
// function that takes a string and checks if it is a palindrome (ignoring spaces and punctuation)
func isPalindrome(_ s: String) -> Bool{
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
// case with odd number palindrome
print(isPalindrome("lol"))

// case with even number and capital letter
print(isPalindrome("KiihhiIk"))

// case with punctuation
print(isPalindrome("K,iih!hiI.k"))

// case with whitespaces + punctuation
print(isPalindrome("Madam, I’m Adam"))

// untrue case
print(isPalindrome("Madame, I’m Adam"))

