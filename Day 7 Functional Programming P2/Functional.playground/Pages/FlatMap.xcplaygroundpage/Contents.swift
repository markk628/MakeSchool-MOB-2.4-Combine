//: [Previous](@previous)

import Foundation

//: # FlatMap
//: #### Exercise 1
/*: Consider the scenario where we want to transform an optional String to an optional `URL` and we try to use `map`.
*/
let receivedData = ["url" :"https://www.google.com"]
let path: String? = receivedData["url"]
let url = path.map { (string: String) -> URL? in
    let url = URL(string: string)
    return url
}
print(url)
//: What happened? How can you explain it? Write your answer in a comment and talk about how you would safely access the url.
// Url is being recognized as an optional. To safely access the url, first check if url exists before running map.

//: Here's an alternative you can do to remove the nesting of optionals using flatmap
let url2 = path.flatMap { (string: String) -> URL? in // We return URL? again
    return URL(string: string) // We return an optional URL
}
print(url2)

/*:
We return a `URL?` again in the `flatMap` function. The closure is still the same but we also "flattened" after the transformation. This removed one layer of optional nesting.

`flatMap` first performs a map, and then it flattens the optional. By using it, you transform optionals while avoiding force unwrapping.
*/
//: #### Exercise 2
/*:
`flatMap` isn’t reserved just for optionals, but for collections as well. It can flatten a nested collection after a mapping operation.
 
Here's an example of how it works. We transform an array of arrays and flatten it into a single array:
*/
let numbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let result = numbers.flatMap({ $0 })
print(result)
//: Now take the following and return an array with the tallest giraffes
let giraffes = [[5, 6, 9], [11, 2, 13, 20], [1, 13, 7, 8, 2]]

var tallestGiraffes = giraffes.map {
    $0.max()
}.flatMap({ $0 })

print(tallestGiraffes)

//var giraffesResult = giraffes.flatMap({$0.max()})
//print(giraffesResult)
//: #### Exploring combinations
/*:
We can combine `flatMap` and  `map` to create powerful transformations. Let's say we need to create a deck of cards
*/
let suits = ["Hearts", "Clubs", "Diamonds", "Spades"]
let faces = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

var deckOfCards = suits.flatMap { suit in
    faces.map { face in
        (suit, face)
    }
}
deckOfCards.shuffle()
print(deckOfCards)
//: #### Exercise 3
/*:
Write a function that duplicates each value inside an array. See if you can use map or flatMap for this.

For example `[1,2,3]` turns into `[1, 1, 2, 2, 3, 3]` and `[["a", "b"],["c", "d"]]`, turns into `[["a", "b"], ["a", "b"], ["c", "d"], ["c", "d"]]`
*/
let numbersList = [["a", "b"],["c", "d"]]
//var duplicatedNumbers = numbersList.map {
//    [$0, $0]
//}.flatMap({ $0 })
//
//print(duplicatedNumbers)

//func duplicates<T>(value: [T]) -> [T] {
//    return value.map ({
//        [$0, $0]
//    }).flatMap({ $0 })
//}

func duplicates<T>(value: [T]) -> [T] {
    return value.flatMap({ [$0, $0] })
}

print(duplicates(value: numbersList))
//: [Next](@next)
