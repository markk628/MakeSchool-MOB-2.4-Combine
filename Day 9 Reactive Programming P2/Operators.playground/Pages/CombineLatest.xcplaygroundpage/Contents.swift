//: [Previous](@previous)

import Foundation
import Combine

let publisherA = PassthroughSubject<String, Never>()
let publisherB = PassthroughSubject<String, Never>()

publisherA
    .combineLatest(publisherB)
    .sink(receiveCompletion: { _ in print("Completed") },
          receiveValue: { print("\($0),\($1)") })

publisherA.send("🐞")
publisherA.send("🦋")
publisherB.send("🕷")
publisherB.send("🕸")
publisherA.send("🐛")
publisherA.send(completion: .finished)
publisherB.send(completion: .finished)

//: [Next](@next)
