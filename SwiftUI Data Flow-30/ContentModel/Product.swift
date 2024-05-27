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
    Product(name: "ვაშლი", image: "Apple", price: 5, inStock: 0),
    Product(name: "ბანანი", image: "Banana", price: 6, inStock: 2),
    Product(name: "მანგო", image: "Mango", price: 7, inStock: 2),
    Product(name: "წიწაკა", image: "Chili", price: 12, inStock: 3),
    Product(name: "ავოკადო", image: "Avocado", price: 10, inStock: 1),
    Product(name: "პომიდორი", image: "Tomato", price: 5, inStock: 2),
    Product(name: "ლიმონი", image: "Lemon", price: 10, inStock: 0),
    Product(name: "მარწყვი", image: "Strawberry", price: 5, inStock: 2),
    Product(name: "სტაფილო", image: "Carrot", price: 5, inStock: 0),
    Product(name: "კივი", image: "Kiwi", price: 15, inStock: 3),
    
]
