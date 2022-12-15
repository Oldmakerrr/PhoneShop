//
//  AddToCardButton.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 10.12.22.
//

import SwiftUI

struct AddToCardButton: View {
    
    private let title: String
    private let price: Double
    private let didTap: (() -> Void)?

    init(title: String,
         price: Double,
         didTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.price = price
        self.didTap = didTap
    }

    var body: some View {
        Button(action: didTap ?? {}) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.assetOrange)
                    .frame(height: 54)
                HStack(spacing: 60) {

                    Text(title)
                        .fontMarkPro700(20)
                    Text((String(format: "$%.2f", price)))
                        .fontMarkPro700(20)
                }
                .foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct addToCardButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCardButton(title: "add To Card", price: 1500)
    }
}
