// CS275
// Lucia Carrera
// Swift Assignment #2
import UIKit


/* DICTIONARY DECLARATION */
// key will be US state names & entries will be arrays of cities/towns in each state
var stateInfo = [ String : [String] ] ()
stateInfo=["Vermont":["Montpelier","Burlington"],"California":["LA"],]


/* PRINT DICTIONARY FUNCTION */
// prints each key and contents of each array of for key

func printDict(_ dict:[ String : [String] ]){
    // var string to print out
    var str = ""
    
    // case if array empty
    if dict.count == 0{
        str="(empty)"
        
    }
    //case if not empty
    else{
        
        // loops over each state(key)
        for (key, arr) in dict {
            str += "\(key): "
            
            // adds each town to string (element of array from current state (key))
            for elem in arr{
                str+="\(elem) "
            }
            
            // next line
            str+="\n"
        }
    }
    // prints result string
    print(str);
}


/* ADD ENTRY FUNCTION */
func addEntry(to key: String, town: String, in dict: inout [ String : [String]]){
    
    // if exists adds town to key with boolean to check if key exist declared as var to be able to modify
    if var townArr = dict[key]{
        // append to array (if let wouldnt be able to
        // & also cant if dict[key] because it is an optional)
        townArr.append(town)
        
        // replace in correct place
        dict[key] = townArr
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
        // removes key from dict if no towns exist for that State
        else{
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

//testing
printDict(stateInfo);

addEntry(to: "Vermont", town:"Winooski", in: &stateInfo);
printDict(stateInfo);

print(countEntries(for: "California", in: stateInfo))



