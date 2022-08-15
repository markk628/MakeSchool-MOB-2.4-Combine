import UIKit

//1
func doubleIt(inputArray: Array<Int>) {
    
    var results = [Int]()
    
    for num in inputArray {
        results.append(num * 2)
    }
    print(results)
}

let input = [1,2,3]
doubleIt(inputArray: input) // [2,4,6]

print(input.map { $0 * 2 })
//print(input.map({ (int) -> Int in
//    int * 2
//}))


//2
let exampleFiles = ["README.md", "HelloWorld.swift", "FlappyBird.swift"]

print(exampleFiles.filter { $0.contains(".swift") })
//print(exampleFiles.filter({ (files) -> Bool in
//    files.contains(".swift")
//}))


//3
print(input.reduce(0) { $0 + $1 })
//print(input.reduce(0, { x, y in
//    x + y
//}))


//4
struct City {
    let name: String
    let population: Int
}

extension City {
    func scalingPopulation() -> City {
        return City(name: name, population: population * 1000)
    }
}

let paris = City(name: "Paris", population: 1000)
let madrid = City(name: "Madrid", population: 5000)
let amsterdam = City(name: "Amsterdam", population: 100)
let berlin = City(name: "Berlin", population: 90000)

let cities = [paris, madrid, amsterdam, berlin]

let filteredCities = cities.filter {$0.population >= 1000}.map { $0.scalingPopulation() }

print(filteredCities.reduce("") { result, city in
    return result + "\n" + city.name + ": " + "\(city.population)"
})

