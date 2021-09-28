// CS275
// Lucia Carrera
// Swift Assignment #3
import UIKit

/* PRIMES AND COMPOSITES */
// helper function that identifies if number is prime or not
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

// newline for readability
print()




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
// second version of previous function that will more thoroughly check if items in food set are healthy or not
func sortFoodSmart(in food: Set<String>, with sortFunction: (String) -> Bool) -> (healthy: Set<String>, unhealthy: Set<String>){
    
    // declaration of sets to return
    var healthy = Set<String>()
    var unhealthy = Set<String>()
    
    // checks every food item in set food
    for thisFood in food {
        
        // asks helper closure if the current food item being evaluated is actually healthy
        if sortFunction(thisFood){
            // if the closure returns true then the food item is inserted into the healthy set
            healthy.insert(thisFood)
        }else{
            // if not is it inserted into the unhealthy foods
            unhealthy.insert(thisFood)
        }
        
    }
    
    // initialization of results tuple to return
    let myResults = ( healthy, unhealthy)
    
    // returning tuple
    return myResults
}


// helper closure to identify if food item is healthy or not
let isHealthy = { (food: String) -> Bool in
    
    // array if healthy foods that could be considered unhealthy if
    let healthyExceptions: Array<String> = ["sugar beets","sugar peas","sugar snap peas"]
    
    // checks if item is part of the healthyExceptions and if so immediately returns true
    for item in healthyExceptions{
        if food == item {
            // == and not contains() so that fried sugar peas will be considered unhealthy
            // this imposes another problem being that green sugar snap peas will be considered unhealthy
            // decided not to keep going as problem description does not specify this should be sorted
            return true
        }
    }
    // checks if item is part of the unhealthyExceptions and if so immediately returns tr
    let unhealthyExceptions: Array<String> = ["fried", "sugar", "sucre", "fritos"]
    for item in unhealthyExceptions{
        if food.contains(item){
            return false
        }
    }
    // if it survives all the last loop then it is healthy
    return true
}

// I realize there is many approaches to sort if healthy or not but I believe that for such a short list of exceptions
// this version is very effective without over-complicating itself and it could easily modifiable to add other healthy exceptions such as
// air-fried broccoli




 // Another approach to the healthy closure could be (but airfried broccoli would not work here)
let isHealthy2 = { (food: String) -> Bool in
 
    // array of food exceptions that could be considered
     let healthySugarnames: Array<String> = ["sugar beets","sugar peas","sugar snap peas"]
     let unhealthyExceptions: Array<String> = ["fried", "sugar", "sucre", "fritos"]

    // loop that goes through all the unhealthy exceptions
     for i in unhealthyExceptions{
 
        // when it specificly checks sugar it will see if it is part of the healthy exceptions with sugar in its name
        // i == sugar so it does not check it when i is for example fritos
         if i == "sugar" && food.contains("sugar"){
             for j in healthySugarnames{
                 if food == j {
                     return true
                 }
             }
             return false
         }else if food.contains(i){
             return false
         }
    }

     return true
 }



/* TESTING HEALTHY FOODS FUNCTION # 2 */
print("results, using smart discriminator")
results = sortFoodSmart(in: myFoods, with: isHealthy)
print("my healthy foods: \(results.healthy)")
print("my unhealthy foods: \(results.unhealthy)")
let wifeFoods: Set = ["bamba", "sugar snap peas", "eggs", "broccoli", "fried chicken"]

print()
print("Sarah’s groceries, using smart discriminator:")
results = sortFoodSmart(in: wifeFoods, with: isHealthy)
print("Sarah’s healthy foods: \(results.healthy)")
print("Sarah’s unhealthy foods: \(results.unhealthy)")


/* TESTING HEALTHY FOODS FUNCTION # 2 with isHealthy2 */
/*
print("\n\n")
print("results, using smart discriminator")
results = sortFoodSmart(in: myFoods, with: isHealthy2)
print("my healthy foods: \(results.healthy)")
print("my unhealthy foods: \(results.unhealthy)")
let wifeFoods2: Set = ["bamba", "sugar snap peas", "eggs", "broccoli", "fried chicken"]

print()
print("Sarah’s groceries, using smart discriminator:")
results = sortFoodSmart(in: wifeFoods2, with: isHealthy2)
print("Sarah’s healthy foods: \(results.healthy)")
print("Sarah’s unhealthy foods: \(results.unhealthy)")
*/
