//
//  CartBadgeButton.swift
//  SwiftUI Data Flow-30
//
//  Created by gvantsa gvagvalia on 5/26/24.
//

import SwiftUI

struct CartBadgeButton: View {
    var productPickedCount: Int
    
    var body: some View {
        ZStack {
            Image(systemName: "cart")
                .font(.system(size: 30))
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 30, height: 30)
                Text("\(productPickedCount)")
                    .font(.caption)
                    .foregroundColor(.white)
                    .font(.system(size: 15))
            }
            .offset(x: 16, y: 13)
        }
    }
}

//#Preview {
//    ItemsInCartBadgeView(productPickedCount: <#Binding<Int>#>)
//}
