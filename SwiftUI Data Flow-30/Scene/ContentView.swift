//
//  ContentView.swift
//  SwiftUI Data Flow-30
//
//  Created by gvantsa gvagvalia on 5/26/24.
//

import SwiftUI
//# colorLiteral()

struct ContentView: View {
    // MARK: - Properties
    @Environment(\.colorScheme) var mode
    @ObservedObject var product: Product = Product(name: "", image: "", price: 0, inStock: 0)
    @StateObject var cartManager = CartManager()
    
    // MARK: - Grid View
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {

        ZStack {

            LinearGradient(
                colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).opacity(0.1), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            
            VStack {
                
                Text("Groceries Type")
                    .fontWeight(.black)
                    .font(.system(size: 42))
                    .foregroundStyle(LinearGradient(
                        colors: [Color.red, Color.blue],
                        startPoint: .leading,
                        endPoint: .trailing))
                    .safeAreaPadding(.top, 50)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productList, id: \.id) { item in
                            ProductCard(product: item)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding()
                }
                
                
                HStack() {
                    CartBadgeButton(productPickedCount: cartManager.products.count)
                        .padding(.trailing, 10)
                    VStack(alignment: .leading) {
                        Text("თანხა:")
                        Text("\(cartManager.formattedTotalPrice) ლ")
                    }
                    Spacer()
                    Button(action: {
                        print("-%")
                        cartManager.makeDiscount(discountPercentage: 20)
                    }) {
                        Text("-20%")
                            .foregroundStyle(.white)
                            .padding()
                            .frame(width: 60)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }

                    Link(destination: URL(string: "https://www.google.com/?client=safari&channel=iphone_bm")!, label: {
                        Text("გადახდა")
                            .foregroundStyle(.white)
                            .padding()
                            .frame(width: 160)
                            .background(Color.black)
                            .cornerRadius(10)
                        
                    })
                }
                .padding()
                .background(.ultraThinMaterial)
                .background(Color.cyan.opacity(0.8))
                .cornerRadius(20)
            }
            
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//#Preview {
//    ContentView()
//}
