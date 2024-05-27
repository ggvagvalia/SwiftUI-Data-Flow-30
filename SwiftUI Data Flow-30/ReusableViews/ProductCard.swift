//
//  ProductCard.swift
//  SwiftUI Data Flow-30
//
//  Created by gvantsa gvagvalia on 5/26/24.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    @ObservedObject var product: Product
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomLeading) {
                    Image(product.image)
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 170, height: 200)
                        .scaledToFit()
                        .shadow(radius: 5)
                        .blur(radius: product.inStock == 0 ? 5 : 0)
                    GeometryReader { geometry in
                        Text((product.inStock == 0) ? "მარაგი ამოწურულია" : "" )
                            .font(.system(size: 20))
                            .bold()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Button(action: {
                                print("Trashhhh")
                                cartManager.deleteFromCart(product: product)
                            }) {
                                Image(systemName: "trash.circle")
                                    .font(.system(size: 35))
                                    .tint(Color.black)
                            }
                            .contentShape(Circle())
                            .padding(10)
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text(product.name)
                                .font(.system(size: 18))
                            Spacer()
                            HStack(spacing: 2) {
                                Button(action: {
                                    print("-")
                                    cartManager.removeItemFromCart(product: product)
                                }) {
                                    Image(systemName: "minus.circle")
                                        .font(.system(size: 23))
                                        .tint(Color.black)
                                        .clipShape(Circle())
                                }
                                .contentShape(Circle())
                                Button(action: {
                                    print("+")
                                    product.inStock != 0 ? cartManager.addItemToCart(product: product) : print ("soryy")
                                    product.inStock != 0 ? print("\(product.inStock)") : ()
                                }) {
                                    Image(systemName: "plus.circle")
                                        .font(.system(size: 23))
                                        .tint(Color.black)
                                        .clipShape(Circle())
                                }
                                .contentShape(Circle())
                            }
                        }
                        .bold()
                        .padding(.leading, 4)
                        .padding(.trailing, 4)
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                    }
                }
                VStack {
                    HStack() {
                        Text("ფასი: ")
                            .bold()
                        Text("\(product.formattedPrice) ლ")
                        Spacer()
                    }
                    .font(.system(size: 17))
                    .padding(.leading, 2.5)
                }
                .padding(.leading, 2.5)
                .padding(.trailing, 2.5)
            }
            .frame(width: 175, height: 230)
        }
    }
}

//#Preview {
//    ProductCard(product: productList[0])
//        .environmentObject(CartManager())
//}
