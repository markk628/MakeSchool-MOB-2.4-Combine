//: [Previous](@previous)

import Foundation
import Combine

let publisher = ["🐣", "🐣", "🐣"].publisher

publisher
    .count()
    .sink(receiveValue: { print("I have \($0) chickens") })

//: [Next](@next)
