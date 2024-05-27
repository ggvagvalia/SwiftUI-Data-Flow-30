//
//  CartManager.swift
//  SwiftUI Data Flow-30
//
//  Created by gvantsa gvagvalia on 5/26/24.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var totalPrice: Double = 0
    var formattedTotalPrice: String {
        String(format: "%.2f", totalPrice)
    }
    private var discountApplied: Bool = false
    
    func addItemToCart(product: Product) {
        guard product.inStock > 0 else { return }
        totalPrice += product.price
        products.append(product)
        
        product.inStock -= 1
    }
    
    func removeItemFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            totalPrice -= product.price
            products.remove(at: index)
            
            product.inStock += 1
        }
    }
    
    func deleteFromCart(product: Product) {
        let sameItemCount = Double(products.filter { $0.id == product.id}.count)
        totalPrice -= product.price * sameItemCount
        products.removeAll(where: { $0.id == product.id})
        
        productList.first { $0.id == product.id }?.inStock += Int(sameItemCount)
    }
    
    func makeDiscount(discountPercentage: Double) {
        for index in 0..<products.count {
            let product = products[index]
            if discountApplied {
                product.price = product.originalPrice
            } else {
                let discountedPrice = product.originalPrice * (1 - discountPercentage / 100)
                product.price = discountedPrice
            }
        }
        
        let totalOriginalPrice = products.reduce(0) { $0 + $1.originalPrice }
        if !discountApplied {
            let totalDiscountedPrice = totalOriginalPrice * (1 - discountPercentage / 100)
            totalPrice = totalDiscountedPrice
        } else {
            totalPrice = totalOriginalPrice
        }
        discountApplied.toggle()
    }
}
