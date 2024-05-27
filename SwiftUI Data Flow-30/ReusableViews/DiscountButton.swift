//
//  DiscountButton.swift
//  SwiftUI Data Flow-30
//
//  Created by gvantsa gvagvalia on 5/27/24.
//

import SwiftUI

struct DiscountButton: View {
    @EnvironmentObject var cartManager: CartManager
    @State var isDiscountPressed: Bool = false
    
    var body: some View {
        Button(action: {
            print("-%")
            cartManager.makeDiscount(discountPercentage: 20)
            isDiscountPressed.toggle()
        }) {
            Text("-20%")
                .foregroundStyle(.white)
                .padding()
                .frame(width: 80)
                .background(isDiscountPressed ? Color.gray : Color.black )
                .cornerRadius(10)
        }
    }
}

//#Preview {
//    DiscountButton()
//}
