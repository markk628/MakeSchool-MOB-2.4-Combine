//: [Previous](@previous)

import Foundation
import Combine

struct Movie {
    let year: Int
    let title: String
}

let movies = [
    (2001, "Harry Potter and the Philosopher's Stone"),
    (2002, "Harry Potter and the Chamber of Secrets"),
    (2004, "Harry Potter and the Prisoner of Azkaban"),
    (2005, "Harry Potter and the Goblet of Fire"),
    (2007, "Harry Potter and the Order of the Phoenix"),
    (2009, "Harry Potter and the Half-Blood Prince"),
    (2010, "Harry Potter and the Deathly Hallows – Part 1"),
    (2011, "Harry Potter and the Deathly Hallows – Part 2"),
]
.compactMap(Movie.init)
.publisher

print(movies.count)

movies
    .contains(where: { $0.year == 2020 })
    .sink(receiveValue: { contains in
        print(contains ? "A HP movie was released" : "No HP movie was released that year.")
    })

//: [Next](@next)
