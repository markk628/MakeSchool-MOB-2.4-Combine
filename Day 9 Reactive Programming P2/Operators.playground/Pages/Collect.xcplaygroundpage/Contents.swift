//: [Previous](@previous)

import Foundation
import Combine


["🐊", "🦖", "🦕", "🐢", "🐍"].publisher
    .collect(1) //variation: specifying receiving up to a number of values
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print($0) })

//: [Next](@next)
