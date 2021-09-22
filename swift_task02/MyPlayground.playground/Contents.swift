// CS275
// Lucia Carrera
// Swift Assignment #2
import UIKit


/* PRINT DICTIONARY FUNCTION */
// prints each key and contents of each array of for key
func printDict(_ dict:[ String : [String] ]){
    
    // case if array empty
    if dict.count == 0{
        print("(empty)")
        
    }
    //case if not empty
    else{
        
        // loops over each state(key)
        for (key, arr) in dict {
            var str = "\(key): "
            
            // adds each town to string (element of array from current state (key))
            for elem in arr{
                str+="\(elem)"
                
                // GRADUATE: prints towns with commas in between
                if elem != arr[arr.count-1]{
                    str+=", "
                }
            }
            // prints result string

           print(str)
        }
    }
}


/* ADD ENTRY FUNCTION */
func addEntry(to key: String, town: String, in dict: inout [ String : [String]]){
    
    // if exists adds town to key with boolean to check if key exist declared as var to be able to modify (optional binding)
    if var townArr = dict[key]{
        
        // GRADUATE: variable created to make sure that if town already exists we dont add a duplicate to the array
        var townExists = false
        var i = 0
        
        // while loop to check all elements in array. Also optimal instead of for loop
        // Reminder: while loop performs a set of statements until a condition becomes false.
        while( i != townArr.count && !townExists){
            
            // if town exists then we
            if townArr[i] == town{
                townExists = true
            }
            i += 1
        }
        
        if townExists == false{
            townArr.append(town)
            // GRADUATE: to sort alphabetically, we assume every entry is being added correctly if not we should but it outside this if statement
            dict[key] = townArr.sorted(by: <)
        }
        
    }
    // if key doesnt exist add new key with town string
    else{
        // create new key with array including town
        let arr = [town]
        dict[key]=arr
    }
}


/* REMOVE ENTRY FUNCTION */
// removes specified town from entry or key if empty array for that key
func removeEntry(from key: String, town: String, in dict: inout [ String : [String] ]){
    
    // create var to remove from arr and check if exists (because dict[key] optional)
    // also called optional binding
    if var townArr = dict[key]{
        
        // checks if town Array of State is not empty
        if townArr.count != 0 {
            
            // variable definitions to be able to break from while loop (townExists) and to loop through array (i)
            var townExists = false
            var i = 0
            
            // loop through array to see if town exists in array
            while(townExists != true && i != townArr.count){
                
                // if it exists remove it from array and modify dictionary entry
                if townArr[i] == town {
                    townArr.remove(at: i)
                    dict[key] = townArr
                    
                    // ends loop if found to not loop through entire array
                    townExists = true
                }
                // counter increased
                i += 1
            }
        }
        // removes key from dict if no towns exist for that State or in previous if array now zero
        // (not specified in instructions but shown in testing results)
        // two ifs are used because a programmer could manually add a State with an Empty town array
        if townArr.count == 0 {
            dict.removeValue(forKey: key)
        }
    }
    // if key doesnt exist in dict does nothing
}


/* COUNT ENTRIES FUNCTION */
// Returns the number of entries in the array for the specified ky. If key not in dictionary then returns zero
func countEntries(for key: String, in dict: [ String : [String] ]) -> Int {
    var numEntries = 0
    // optional binding
    if let townArr = dict[key]{
        numEntries = townArr.count
    }
    // What if key in dictionary but no towns? Also zero -> should be different results?
    return numEntries
}


/* TESTING FUNCTIONS */
// added empty print statements for readability
var stateInfo = [ String:[String] ] ()
printDict(stateInfo)
print()

stateInfo["California"]
addEntry(to: "Vermont", town: "Burlington", in: &stateInfo)
addEntry(to: "Vermont", town: "Burlington", in: &stateInfo)

addEntry(to: "Vermont", town: "Montpelier", in: &stateInfo)
addEntry(to: "Vermont", town: "Williston", in: &stateInfo)
addEntry(to: "Vermont", town: "South Burlington", in: &stateInfo)
addEntry(to: "Vermont", town: "Winooski", in: &stateInfo)
addEntry(to: "Vermont", town: "Winooski", in: &stateInfo)

addEntry(to: "Massachusetts", town: "Boston", in: &stateInfo)
addEntry(to: "Massachusetts", town: "Boston", in: &stateInfo)
addEntry(to: "Massachusetts", town: "Beverly", in: &stateInfo)
addEntry(to: "Massachusetts", town: "Beverly", in: &stateInfo)
addEntry(to: "Massachusetts", town: "Beverly", in: &stateInfo)
addEntry(to: "Massachusetts", town: "Beverly", in: &stateInfo)
addEntry(to: "Massachusetts", town: "Beverly", in: &stateInfo)

addEntry(to: "Massachusetts", town: "Springfield", in: &stateInfo)
printDict(stateInfo)
print()

removeEntry(from: "Vermont", town: "Montpelier", in: &stateInfo)
removeEntry(from: "Vermont", town: "Colchester", in: &stateInfo)
removeEntry(from: "Maine", town: "Portland", in: &stateInfo)
printDict(stateInfo)
print()

print("# entries for Vermont = \(countEntries(for: "Vermont", in: stateInfo))")
print("# entries for Massachusetts = \(countEntries(for: "Massachusetts", in: stateInfo))")
print("# entries for Maine = \(countEntries(for: "Maine", in: stateInfo))")
print()

addEntry(to: "Maine", town: "Orono", in: &stateInfo)
printDict(stateInfo)
print()

removeEntry(from: "Maine", town: "Orono", in: &stateInfo)
printDict(stateInfo)



