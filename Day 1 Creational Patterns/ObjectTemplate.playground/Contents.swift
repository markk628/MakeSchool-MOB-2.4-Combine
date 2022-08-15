import UIKit

var products = [
   ("Kayak", "A boat for one person", 275.0, 10),
   ("Lifejacket", "Protective and fashionable", 48.95, 14),
   ("Soccer Ball", "FIFA-approved size and weight", 19.5, 32)]

func calculateTax(product:(String, String, Double, Int)) -> Double {
   return product.2 * 0.2;
}

func calculateStockValue(tuples:[(String, String, Double, Int)]) -> Double {
   return tuples.reduce(0, {
       (total, product) -> Double in
       return total + (product.2 * Double(product.3))
   });
}

//print("Sales tax for Kayak: $\(calculateTax(product: products[0]))")
//print("Total value of stock: $\(calculateStockValue(tuples: products))")


struct Product {
    var name: String
    var description: String
    var price: Double
    var stock: Int
    
    init(name: String, description: String, price: Double, stock: Int) {
        self.name = name
        self.description = description
        self.price = price
        self.stock = stock
    }
}

var products2: [Product] = [
    Product(name: "Kayak", description: "A boat for one person", price: 275.0, stock: 10),
    Product(name: "Lifejacket", description: "For people who don't know how to swim", price: 48.95, stock: 14),
    Product(name: "Soccer Ball", description: "Stole it from annoying kid", price: 19.5, stock: 32)
]

func calculateNewTax(product: Product) -> Double {
    return product.price * 0.2
}

func calculateNewStockValue(products: [Product]) -> Double {
    return products.reduce(0) { (total, product) -> Double in
        return total + (product.price * Double(product.stock))
    }
}

print("Sales tax for Kayak: $\(calculateNewTax(product: products2[0]))")
print("Total value of stock: $\(calculateNewStockValue(products: products2))")
