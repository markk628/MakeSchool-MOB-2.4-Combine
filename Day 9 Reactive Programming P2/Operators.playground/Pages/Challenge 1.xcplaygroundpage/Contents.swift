//: [Previous](@previous)

import Foundation
import Combine

/*:
 Create an example that publishes a collection of numbers from 1 through 100.
 
 Use filter operators to:
 - Skip the first 80 values emitted
 - Take the next 20 values after that
 - Show only even numbers
 
 Expexcted output: 82, 84, 86, 88, 90, 92, 94, 96, 98, 100
 */

let numbers = (1...100).publisher

numbers
    .filter { $0 > 80 } 
    .filter { $0 % 2 == 0}
    .sink(receiveValue: { number in
        print(number)
    })

//: [Next](@next)
