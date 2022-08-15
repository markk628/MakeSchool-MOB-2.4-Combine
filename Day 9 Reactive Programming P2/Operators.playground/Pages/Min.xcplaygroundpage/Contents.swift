//: [Previous](@previous)

import Foundation
import Combine

let publisher = [100, 80, -2, 0].publisher

publisher
    .min()
    .sink(receiveValue: { print("Smallest value: \($0)") })

//: [Next](@next)
