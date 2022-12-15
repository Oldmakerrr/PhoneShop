//
//  BestSellerCollectionView.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

struct BestSellerCollectionView: View {
    
    private var bestSellers: [BestSeller]
    private let padding: CGFloat = 10
    private let height: CGFloat = 227
    private let didTap: (() -> Void)?

    private var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    init(bestSellers: [BestSeller],
         didTap: (() -> Void)? = nil) {
        self.bestSellers = bestSellers
        self.didTap = didTap
    }

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                HeaderView(title: "Best Seller", buttonTitle: "see more")
                ScrollView {
                    LazyVGrid(columns: columns, spacing: padding) {
                        ForEach(bestSellers) { bestSeller in
                            BestSellerCell(bestCeller: bestSeller, didTap: didTap)
                                .frame(width: geo.size.width / 2 - padding * 3)
                                .frame(minHeight: height)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct BestSellerCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerCollectionView(bestSellers: [.mock, .mock, .mock,.mock, .mock, .mock])
    }
}
