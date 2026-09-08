/*
Brian Brown, S00709110
Dr. Bhavana Bhardwaj
CIS 0395 App Development for iOS Device
M, W 12 - 12:50 p.m.
Assignment: Swift Playground - Part 1
Due Date: 9/4/26
*/

import UIKit

// Task 1: Constants and Variables

let schoolName = "Greenwood High" // school name constant
var numberOfStudents = 350 // number of students variable

numberOfStudents += 20 // add 20 to the number of students

print("Number of students is \(numberOfStudents)")


// Task 2: Data Types and Type Inference

var studentName = "Brian Brown" // variable inferred as a String

var studentAge: Int = 65 // explicitly declared Int
var gradeAverage = 89.5 // inferred as a Double

// print statement using string interpolation for variables
print("\(studentName) is \(studentAge) years old and has an average grade of \(gradeAverage)")


// Task 3: Type Safety

// studentAge = "seventeen" // gives error of Cannot assign value of type 'String' to type 'Int'
// This error occurs because the variable has been declared as an Int and this line of code tries to assign a String.


// Task 4: Operators

// Int inferred variables
var mathScore = 92
var scienceScore = 85
var scoreNumber = 2 // variable instead of hardcoding number of scores in average calculation below

// Int inferred totalScore declaration and initialization with sum of two above variables
var totalScore = mathScore + scienceScore
// Double inferred variable initialized by type converting totalScore from an Int to a Double and then dividing by number of scores for an average. I had to type convert scoreNumber to Double also!!
var averageScore = Double(totalScore) / Double(scoreNumber)

// using comparison operator to determine if mathScore higher
var isMathBetter = mathScore > scienceScore

// print statement printing all score information using newline (\n)
// if / else based on if math score is greater than science score or not
if (isMathBetter)
    { print("Math Score: \(mathScore)\nScience Score: \(scienceScore)\nTotal Score: \(totalScore)\nAverage Score: \(averageScore)\nMath is the higher score") }
else
    { print("Math Score: \(mathScore)\nScience Score: \(scienceScore)\nTotal Score: \(totalScore)\nAverage Score: \(averageScore)\nScience is the higher score") }


// Task 5: Print Creatively

gradeAverage = 98.5 // I didn't like the lower grade average!!! LOL

var isScienceBetter = scienceScore > mathScore // added in case scores are equal

var scoreResult: String // this will store the if / else logic for inclusion into the multi-line print statement

// if / else to fill scoreResult with appropriate string
if (isMathBetter)
    { scoreResult = "Math score is higher." }
else if (isScienceBetter)
    { scoreResult = "Science score is higher." }
else
    { scoreResult = "Math and science have the same score." }

// multi-line print statement to produce a neatly output score report without using multiple print staements or multiple newline characters
print("""
Welcome to Assignment 2: Playgound Part 1 in iOS Development Class

My name is \(studentName). I am \(studentAge) years old with an average grade of \(gradeAverage)

Math Score: \(mathScore)
Science Score: \(scienceScore)
Total Score: \(totalScore)
Average Score: \(averageScore)

\(scoreResult)
""")
// I like this multi-line printing but it requires some forethought!


