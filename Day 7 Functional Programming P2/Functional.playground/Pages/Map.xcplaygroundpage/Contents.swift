
import Foundation

//: # Map
//: #### Exercise 1
/*: Taking a collection of data to transform it is a common task any iOS dev must do.
 
Take for example an array of students and their attendance to a course.
*/
let attendance = [
    (name: "Adriana", sessions: 80),
    (name: "Mitchell", sessions: 10),
    (name: "Joi", sessions: 13),
    (name: "Ian", sessions: 14),
    (name: "Jess", sessions: 0),
]
/*:
How would you transform the data to present readable sentences of their status in the course stored in an array?
 
Take the following conditions:
- If a student has <12 they are at risk
- Any other case, they are on track
 
Expected result:
 
["Adriana is at risk", "Mitchell is at risk", "Joi is on track", "Ian is on track"]
*/
//Iterative version
//var status = [String]()
//for student in attendance {
//    if student.sessions < 12 {
//        status.append("\(student.name) is at risk")
//    } else {
//        status.append("\(student.name) is on track")
//    }
//}
//
//print(status)

//Functional version
//var mapStatus = [String]()
//attendance.map {
//    if $0.sessions < 12 {
//        mapStatus.append("\($0.name) is at risk")
//    } else {
//        mapStatus.append("\($0.name) is on track")
//    }
//}
//
//print(mapStatus)

//var mapStatus2 = attendance.map { (name, session) -> String in
//    if session < 12 {
//        return "\(name) is at risk"
//    } else {
//        return "\(name) is on track"
//    }
//}
//
//print(mapStatus2)

var mapStatus3 = attendance.map { $0.sessions < 12 ? "\($0.name) is at risk" : "\($0.name) is on track"}
print(mapStatus3)
/*:
 Now you need a function that takes students and their attendance and return only the session value, sorter and with zeros filtered out (most likely those students withdrew).
*/

//Functional approach, try chaining functions together with a pipeline.
//var mapSessions = [Int]()
//attendance.filter {
//    $0.sessions > 0
//}.map {
//    mapSessions.append($0.sessions)
//}
//
//print(mapSessions.sorted())

//var mapSessions2 = attendance.filter {
//    $0.sessions > 0
//}.map { (name, session) -> Int in
//    return session
//}
//
//print(mapSessions2.sorted())

var mapSessions3 = attendance
                    .filter { $0.sessions > 0 }
                    .map { $0.sessions }
                    .sorted()
print(mapStatus3)
//: #### Exercise 2
/*:
Create a function that transforms the values in a dictionary for books. Each rating needs to be turned into human readable format.
*/
let bookRatings: [String : Float] = ["Atomic Habits" : 5.0, "Getting Things Done" : 4.5, "Grit" : 4.0, "The Lean Startup" : 3.9]
//var ratings = [String]()
//bookRatings.map {
//    if $0.value < 4.0 {
//        ratings.append("\($0.key) is trash")
//    } else if $0.value < 5.0 {
//        ratings.append("\($0.key) is ok")
//    } else if $0.value == 5.0 {
//        ratings.append("\($0.key) is good")
//    }
//}
//
//print(ratings)

var ratings2 = bookRatings.map { (book) -> String in
    if book.value == 5.0 {
        return "\(book.key) is good"
    } else if book.value < 5.0 && book.value > 3.9 {
        return "\(book.key) is ok"
    } else {
        return "\(book.key) is trash"
    }
}

print(ratings2)

//func apply<T, V>(fn: ([T]) -> V, args: [T]) -> V {
//    return fn(args)
//}
//
//func checkRatings(a: [String: Float]) -> [String] {
//    return a.map { (book) -> String in
//        if book.value == 5.0 {
//            return "\(book.key) is good"
//        } else if book.value < 5.0 && book.value > 3.9 {
//            return "\(book.key) is ok"
//        } else {
//            return "\(book.key) is trash"
//        }
//    }
//}
//
//let applied = apply(fn: checkRatings, args: bookRatings)
//: #### Exercise 3
/*:
The following code gets the street and city and cleans up the strings. See if you can reduce the code using map.
*/
let contact = ["address": ["zipcode": "94109","street":"post","city": "san francisco"]]

func capitalizedAndTrimmed(_ string: String) -> String {
    return string.trimmingCharacters(in: .whitespaces).capitalized
}

var capitalizedStreet: String? = nil
var capitalizedCity: String? = nil

if let address = contact["address"] {
    if let street = address["street"] {
        capitalizedStreet = capitalizedAndTrimmed(street.capitalized)
    }
    if let city = address["city"] {
        capitalizedCity = capitalizedAndTrimmed(city.capitalized)
    }
}

print(capitalizedStreet)
print(capitalizedCity)

// Cleaned up version
var capitalizedStreetMap: String? = nil
var capitalizedCityMap: String? = nil

contact["address"].map {
    capitalizedStreetMap = capitalizedAndTrimmed($0["street"]!)
    capitalizedCityMap = capitalizedAndTrimmed($0["city"]!)
}

print(capitalizedStreetMap!)
print(capitalizedCityMap!)
//: [Next](@next)
