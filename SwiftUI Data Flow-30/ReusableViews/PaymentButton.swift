//
//  PaymentButton.swift
//  SwiftUI Data Flow-30
//
//  Created by gvantsa gvagvalia on 5/27/24.
//

import SwiftUI

struct PaymentButton: View {
    var body: some View {
        Link(destination: URL(string: "https://www.google.com/?client=safari&channel=iphone_bm")!, label: {
            Text("გადახდა")
                .foregroundStyle(.white)
                .padding()
                .frame(width: 160)
                .background(Color.black)
                .cornerRadius(10)
        })
    }
}

#Preview {
    PaymentButton()
}
