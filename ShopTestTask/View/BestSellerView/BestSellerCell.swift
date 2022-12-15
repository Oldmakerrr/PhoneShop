//
//  BestSellerCell.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

struct BestSellerCell: View {

    @State private var bestCeller: BestSeller
    private let didTap: (() -> Void)?
    
    private var discountPrice: String {
        "$\(bestCeller.discountPrice)"
    }
    
    private var priceWithoutDiscount: String {
        "$\(bestCeller.priceWithoutDiscount)"
    }
    
    private var favoritIcon: Image {
        .init(systemName: bestCeller.isFavorites ? "heart.fill" : "heart")
    }

    init(bestCeller: BestSeller,
         didTap: (() -> Void)? = nil
    ) {
        self.bestCeller = bestCeller
        self.didTap = didTap
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: .init(string: bestCeller.pictureUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 168)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .bottom) {
                    Text(discountPrice)
                        .fontMarkPro700(16)
                        .foregroundColor(.assetDarkBlue)
                    Text(priceWithoutDiscount)
                        .fontMarkPro500(10)
                        .strikethrough()
                        .foregroundColor(.assetDarkGray)
                }
                Text(bestCeller.title)
                    .fontMarkPro400(10)
                    .foregroundColor(.assetDarkBlue)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(color: .black.opacity(0.1), radius: 5)
        )
        .onTapGesture(perform: didTap ?? {})
        .overlay(alignment: .topTrailing) {
            CircleImageButton(image: favoritIcon) {
                bestCeller.isFavorites.toggle()
            }
        }
    }
}

struct BestSellerCell_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerCell(bestCeller: .mock)
    }
}
