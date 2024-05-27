//
//  Product.swift
//  SwiftUI Data Flow-30
//
//  Created by gvantsa gvagvalia on 5/26/24.
//

import Foundation
class Product: ObservableObject {
    var id = UUID()
    var name: String
    var image: String
    @Published var price: Double
    @Published var inStock: Int
    var originalPrice: Double
    var discountApplied: Bool = false
    
    var formattedPrice: String {
          String(format: "%.2f", price)
      }
    init(id: UUID = UUID(), name: String, image: String, price: Double, inStock: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.originalPrice = price
        self.inStock = inStock
    }
}

var productList = [
    Product(name: "Apple", image: "Apple", price: 5, inStock: 0),
    Product(name: "Banana", image: "Banana", price: 6, inStock: 2),
    Product(name: "Avocado", image: "Avocado", price: 5, inStock: 1),
    Product(name: "Tomato", image: "Tomato", price: 5, inStock: 2),
    Product(name: "Lemon", image: "Lemon", price: 5, inStock: 0),
    Product(name: "Strawberry", image: "Strawberry", price: 5, inStock: 2),
    Product(name: "Carrot", image: "Carrot", price: 5, inStock: 0),
//    Product(inStock: 0, name: "Apple", image:"Apple", price: 5),
//    Product(inStock: 2, name: "Banana", image: "Banana", price: 6),
//    Product(inStock: 2, name: "Avocado", image: "Avocado", price: 5),
//    Product(inStock: 1, name: "Tomato", image: "Tomato", price: 5),
//    Product(inStock: 1, name: "Lemon", image: "Lemon", price: 5),
//    Product(inStock: 2, name: "Strawberry", image: "Strawberry", price: 5),
//    Product(inStock: 0, name: "Carrot", image: "Carrot", price: 5),
]
