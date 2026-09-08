/*
Brian Brown, S00709110
Dr. Bhavana Bhardwaj
CIS 0395 App Development for iOS Device
M, W 12 - 12:50 p.m.
Assignment: Swift Playground - Part 2
Due Date: 9/4/26
*/

import UIKit

// Task 1: Conditional Logic with If and Switch
var age: Int = 65
var person: String = "N/A"
var parity = "N/A"

// Check a person's age
// handles anything below the given parameters
if (age > 0) && (age < 13) // Age 1 - 12
    { person = "child" }
else if (age >= 13) && (age < 20) // Age 13 - 19
    { person = "Teenager" }
else if (age >= 20) && (age < 60) // Age 20 - 59
    { person = "Adult" }
else { person = "Senior" } // Age 60+

if (age <= 0 ) {
    person = "N/A"
    parity = "N/A"
}
else
{
    switch(age % 2) // finds a remainder of the division - even has none
    {
    case 0: parity = "Even"
    case 1: parity = "Odd"
    default: parity = "N/A" // eliminates "Switch must be exhaustive" error
    }
}
print (person)
print (parity)


// Task 2: Optionals and Optional Binding
var  favouriteNumber: Int?

if (favouriteNumber != nil) // if NOT nil
{
    // used optional binding to unwrap favorite number
    if let unwrappedFavNum = favouriteNumber
    { print("Your favorite number is \(unwrappedFavNum).") }
}
else // if nil
    { print("No favorite number set.") }

// used nil-coalescing operator (??)
print("Your favorite number is \(favouriteNumber ?? 7).")


// Task 3: Arrays and Loops
var score = [ 72, 88, 95, 63, 80, 99 ]
var highestScore = score[0] // Assume the first

// loops through array and if score at the new index is
// higher than saved highestScore, replaces it
for i in 0..<score.count
{
    if score[i] > highestScore
    { highestScore = score[i] }
}
print("Highest score is \(highestScore)")

// loops through array and if score at the new index is
// higher than 85, prints it
for i in score
{
    if i > 85
    {
        print (i)
    }
}

 
var lowestCnt = 0
var i = 0

// loops through array (while index is less then the
// length of the score array, then counts how many scores
// are below 70 by adding 1 to the lowestCnt
while i < score.count {
    if score[i] < 70 { lowestCnt += 1 }
    i += 1
}

// strictly a language structure if-else to prevent
// printing There are 1 scores ...
if lowestCnt == 1 {
    print("There is \(lowestCnt) score less than 70.")
}
else {
    print("There are \(lowestCnt) scores less than 70.")
}


// Task 4: Dictionaries
var cityPop: [String: Int] = ["New York": 8_300_000, "Boston": 700_000, "Chicago": 2_700_000]

// have to treat as optionals in case key does not exist
if let newYork = cityPop["New York"] {
    print("New York's population is \(newYork.formatted())")
}
if let boston = cityPop["Boston"] {
    print("Boston's population is \(boston.formatted())")
}
if let chicago = cityPop["Chicago"] {
    print("Chicago's population is \(chicago.formatted())")
}

// added a ditionary key:value pair
cityPop["San Francisco"] = 870_000
if let sanFrancisco = cityPop["San Francisco"] {
    print("San Francisco's population is \(sanFrancisco.formatted())")
}

// updated Boston population
cityPop.updateValue(750_000, forKey: "Boston")
if let boston = cityPop["Boston"] {
    print("Boston's population is \(boston.formatted())")
}

// removed Chicago by making value nil
cityPop["Chicago"] = nil

if let chicago = cityPop["Chicago"] {
    print("Chicago's population is \(chicago.formatted())")
}
 print(cityPop)


// Task 5: Type Casting with Any in Array
// created an array containing different data types - this works by
// declaring it as [Any] which stores the values in an Any "box" but
// preserves the original type
var various = [ 42, "swift", 3.14, true ] as [Any]

// this loops through the array attempting to cast each value to a
// specific type and if successful, if let unwraps the value and
// prints it as that type. cast failure will return a nil causing
// execution to drop to the next else if statement
for i in various {
    if let value = i as? Int {
        print("Integer value: \(value)")
    }

    else if let value = i as? String {
        print("String value: \(value)")
    }

    else if let value = i as? Double {
        print("Double value: \(value)")
    }

    else if let value = i as? Bool {
        print("Boolean value: \(value)")
    }
    
    else { print("Unknown") }
}


