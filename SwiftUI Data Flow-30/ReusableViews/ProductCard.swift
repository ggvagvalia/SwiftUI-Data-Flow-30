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
                    
                    Text((product.inStock == 0) ? "out of stock" : "" )
                        .position(x: 170 / 2, y: 200 / 2)
                        .font(.system(size: 28))
                        .bold()
                        .foregroundColor(.black)
                    VStack() {
                        HStack {
                            Button(action: {
                                print("Trashhhh")
                                cartManager.deleteFromCart(product: product)
                            }) {
                                Image(systemName: "arrow.up.trash")
                                    .font(.system(size: 23))
                                    .tint(Color.red)
                                    .bold()
                            }
                            .contentShape(Circle())
                            .padding(10)
                            Spacer()
                        }
                        
                        Spacer()
                        HStack {
                            Text(product.name)
                                .font(.system(size: 19))
                            Spacer()
                            Button(action: {
                                print("----")
                                cartManager.removeItemFromCart(product: product)
                            }) {
                                Image(systemName: "minus.circle")
                                    .font(.system(size: 23))
                                    .tint(Color.black)

                            }
                            .contentShape(Circle())
                            Button(action: {
                                print("++++")
                                product.inStock != 0 ? cartManager.addItemToCart(product: product) : print ("soryy")
                                product.inStock != 0 ? print("\(product.inStock)") : ()
                            }) {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 23))
                                    .tint(Color.black)
                            }
                            .contentShape(Circle())
                            
                        }
                        .bold()
                        .padding(8)
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
                    
                    HStack {
                        
                        
                    }
                }
                .padding(.leading, 2.5)
                .padding(.trailing, 2.5)
            }
            .frame(width: 170, height: 230)
        }
    }
}

#Preview {
    ProductCard(product: productList[0])
        .environmentObject(CartManager())
}
