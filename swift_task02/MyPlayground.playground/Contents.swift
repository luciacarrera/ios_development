// CS275
// Lucia Carrera
// Swift Assignment #2
import UIKit

/* DICTIONARY DECLARATION */
// key will be US state names & entries will be arrays of cities/towns in each state
var stateInfo = [ String : [String] ] ()
stateInfo=["Vermont":["Montpelier","Burlington"],"Vemont":["Montpelier","Burlington"],]


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
    if var stateExists = dict[key]{
        // append to array (if let wouldnt be able to
        // & also cant if dict[key] because it is an optional)
        stateExists.append(town)
        
        // replace in correct place
        dict[key] = stateExists
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
    // create var to remove from arr and check if exists?
    var stateExists = dict[key]
    // removes key from dict
    dict.removeValue(forKey: key)
}

//testing
printDict(stateInfo);
addEntry(to: "Ve", town:"Winooski", in: &stateInfo);
printDict(stateInfo);
removeEntry(from: "V", town: "Winooski", in: &stateInfo)
printDict(stateInfo);
