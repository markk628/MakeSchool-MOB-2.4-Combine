import UIKit

class DataSource {
    
    static let sharedInstance = DataSource()
    
    var creationalPatternsArray = ["Abstract Factory", "Factory Method", "Builder", "Dependency Injection", "Lazy Initialization", "Object Pool", "Prototype", "Singleton"]
    
    private init() {
        print("self is:", self)
        print("creationalPatternsArray is", creationalPatternsArray)
    }
}

print(DataSource.sharedInstance)

func looper() {
    for pattern in DataSource.sharedInstance.creationalPatternsArray {
        print(pattern)
    }
}

looper()
