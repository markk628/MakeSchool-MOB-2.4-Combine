//: [Previous](@previous)

import Foundation
import Combine

let publisherA = ["1️⃣", "2️⃣", "3️⃣"].publisher
let publisherB = ["4️⃣", "5️⃣", "6️⃣"].publisher

publisherA
    .append(publisherB)
    .sink(receiveValue: { print($0) })

//: [Next](@next)
