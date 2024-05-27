//
//  ContentView.swift
//  SwiftUI Data Flow-30
//
//  Created by gvantsa gvagvalia on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @Environment(\.colorScheme) var mode
    @EnvironmentObject var product: Product
    @ObservedObject private var cartManager = CartManager()
    @State private var isDiscountPressed = false
    
    // MARK: - Grid View
    var columns = [GridItem(.adaptive(minimum: 175), spacing: 5)]
    
    var body: some View {
        let backgroundColorForView: Color = mode == .light ? .white : .gray.opacity(0.5)
        
        ZStack {
            LinearGradient(
                colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).opacity(0.2), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            
            VStack {
                Text("Vegetable / Fruit")
                    .font(.system(size: 32))
                    .bold()
                    .safeAreaPadding(.top, 55)
                
                CartView()
                    .environmentObject(cartManager)
                
                    .background(backgroundColorForView)
                    .cornerRadius(15)
                    .frame(width: 360, height: 55)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productList, id: \.id) { item in
                            ProductCard(product: item)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                    HStack(spacing: 3) {
                        VStack(alignment: .leading) {
                            Text("თანხა:")
                            Text("\(cartManager.formattedTotalPrice) ლ")
                        }
                        Spacer()
                        
                        DiscountButton(isDiscountPressed: isDiscountPressed)
                            .environmentObject(cartManager)
                        PaymentButton()
                        
                    }
                    .padding()
                }
                .background(backgroundColorForView)
                .frame(width: 370, height: 90)
                .cornerRadius(20)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
