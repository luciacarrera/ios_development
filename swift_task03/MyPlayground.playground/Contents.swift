// CS275
// Lucia Carrera
// Swift Assignment #3
import UIKit

/* PRIMES AND COMPOSITES */
// function that identifies if number is prime or not
func isPrime(_ val: Int) -> Bool?{
    
    // declaring of optional to return
    var prime: Bool?
    
    // checks if value lower than 2 (other)
    if val < 2{
        prime = nil
    }
    // Make sure val is not one of the principal divisors (2, 3, 5 and 7)
    else if val == 2 || val == 3 || val == 5 ||  val == 7{
        prime = true
    }
    // checks if divisible by principal divisors
    else if val % 2 == 0 || val % 3 == 0 || val % 5 == 0 ||  val % 7 == 0{
        prime = false
        
    // a number is considered prime if it can only be divisible by 1
    // the algorithmn I am going to follow to discover if int is prime is to loop check if it is divisible by
    // all the odd numbers from 11 (where we left off in the else if) until loop reaches the val squared.
    } else{
        let limit = val * val
        var i = 11
        
        // set default to true because if while loop goes through until limit it means it is prime
        prime = true
        // Reminder: while loop performs a set of statements until a condition becomes false.
        while(i != limit && prime != true){
            
            // checks if divisible by odd number
            if( val % i == 0 ){
                prime = false
            }
            // goes to next odd number
            i += 2
        }
    }
    
    
    return prime
}

// function that categorizes set of integers into prime or not
func categorizeIntegers(in vals: Set<Int>) -> (prime: Set<Int>, composite: Set<Int>, other: Set<Int>){
        
    // declaration of sets to return
    var prime = Set<Int>()
    var composite = Set<Int>()
    var other = Set<Int>()

    // loops through all elements in set to sort them
    for elem in vals{
        
        // Because isPrime returns an optional we must do optional binding
        let numIsPrime = isPrime(elem)
        
        if numIsPrime == true{
            prime.insert(elem)
            
        } else if numIsPrime == false {
            composite.insert(elem)

        } else {
            other.insert(elem)

        }
    }
    // initialization of results tuple to return
    let myResults = ( prime, composite, other)
    
    // returning tuple
    return myResults
}

/* TESTING FUNCTION PRIMES AND COMPOSITES */
let vals = Set(-5...100)
var resultsPrime = categorizeIntegers(in: vals)

// print below should print out the numbers: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97.
print("Prime nums: ", resultsPrime.prime.sorted())

// print below should print out the numbers: -5, -4, -3, -2, -1, 0, 1
print("Other nums: ", resultsPrime.other.sorted())

// should print out the rest of the numbers
print("Composite nums: ", resultsPrime.composite.sorted())

// 2 newlines for readability
print("\n\n")



/* HEALTHY FOODS FUNCTION # 1 */
// function that takes a set of foods and sorts them into healthy or unhealthy
func sortFood(in food: Set<String>) -> (healthy: Set<String>, unhealthy: Set<String>){
    
    // declaration of sets to return
    var healthy = Set<String>()
    var unhealthy = Set<String>()
    
    // checks every food item in set food
    for thisFood in food {
        
        // Checks if thisFood has the word sugar in its name, if so it is classified as unhealthy.
        if (thisFood.contains("sugar")){
            unhealthy.insert(thisFood)
            
        }
        // if not classified as healthy
        else{
            healthy.insert(thisFood)

        }
    }
    
    // initialization of results tuple to return
    let myResults = ( healthy, unhealthy)
    
    // returning tuple
    return myResults
}



/* TESTING HEALTHY FOODS FUNCTION # 1 */
let myFoods: Set = ["apples", "chocolate frosted sugar bombs", "cauliflower", "olives", "refined sugar", "sugar beets", "fritos", "sugar peas", "fried dough", "broccoli", "broccoli au sucre", "broccoli au lapin"]
print("results, using simple discriminator:")
var results = sortFood(in: myFoods)
print("my healthy foods: \(results.healthy)")
print("my unhealthy foods: \(results.unhealthy)")
print()


/* HEALTHY FOODS FUNCTION # 2 */
// second version of previous function that will more thoroughly check if food is healthy or not
func sortFoodSmart(in food: Set<String>, with sortFunction: (String) -> Bool) -> (healthy: Set<String>, unhealthy: Set<String>){
    
    // declaration of sets to return
    var healthy = Set<String>()
    var unhealthy = Set<String>()
    
    // checks every food item in set food
    for thisFood in food {
        
    }
    return ...
}


/* TESTING HEALTHY FOODS FUNCTION # 2 */


