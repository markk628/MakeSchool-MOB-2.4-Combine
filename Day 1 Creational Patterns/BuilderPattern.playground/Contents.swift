import UIKit

enum BicycleSize: String {
    case small
    case medium
    case large
}

enum BicycleType : String {
    case kids
    case standard
    case mountain
}

struct Bicycle {
    public let type: BicycleType
    public let color: UIColor
    public let size: BicycleSize
}

extension Bicycle: CustomStringConvertible {
    public var description: String {
        return type.rawValue + " bicycle"
    }
}

// Builder Protocol
protocol BikeBuilder {
    var type: BicycleType { get set }
    var color: UIColor { get set }
    var size: BicycleSize { get set }
    
    func construct() -> Bicycle
}

// MARK: - Builder
class BicycleBuilder: BikeBuilder {
    
    var type: BicycleType = .standard
    var color: UIColor = .gray
    var size: BicycleSize = .medium
    
    func construct() -> Bicycle {
        return Bicycle(type: type, color: color, size: size)
    }
}

// MARK: - Director
public class BikeAssembler {
    
    // Build a kids bike
    func createKidsBike() -> Bicycle {
        let builder = BicycleBuilder()
        builder.type = .kids
        builder.size = .small
        return builder.construct()
    }
    
    // TODO: 1) build the Mountain bike
    func createMountainBike() -> Bicycle {
        let builder = BicycleBuilder()
        builder.type = .mountain
        builder.size = .large
        builder.color = .black
        return builder.construct()
    }
    
    // TODO: 2) the Standard bike
    func createStandardBike() -> Bicycle {
        let builder = BicycleBuilder()
        builder.type = .standard
        builder.size = .medium
        builder.color = .blue
        return builder.construct()
    }
}

//let bikeAssembler = BikeAssembler()
//let kids = bikeAssembler.createKidsBike()
//let mountain = bikeAssembler.createMountainBike()
//let standard = bikeAssembler.createStandardBike()
//print(kids.description)
//print(mountain.description)
//print(standard.description)

let strings = ["1", "two","three", "4", "cinq"].publisher

strings
    .compactMap { Int($0) }
    .sink(receiveValue: {
        print($0)
    })
