//: [Previous](@previous)

import Foundation
import Combine

let start = Date()

var subscriptions = Set<AnyCancellable>()

Timer.publish(every: 1.0, on: .main, in: .common)
    .autoconnect()
    .map({ (output) in
        return output.timeIntervalSince(start)
    })
    .map({ (timeInterval) in
        return Int(timeInterval)
    })
    .sink { (seconds) in
        print("Seconds: \(seconds)")
    }
    .store(in: &subscriptions)

//: [Next](@next)
