//
//  CartView.swift
//  SwiftUI Data Flow-30
//
//  Created by gvantsa gvagvalia on 5/27/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 1)
            HStack(spacing: 30) {
                CartBadgeButton(productPickedCount: cartManager.products.count)
                    .padding(.leading, 5)
                Spacer()
                ForEach(cartManager.products, id: \.id) { product in
                    Image(product.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .padding(.leading, -55)
                }
            }
        }
    }
}

//
//#Preview {
//    CartView()
//}
