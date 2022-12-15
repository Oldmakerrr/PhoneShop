//
//  Product.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import Foundation

struct Product: Identifiable, Decodable {
    var id = UUID().uuidString

    let homeStore: [HomeStore]
    let bestSeller: [BestSeller]

    enum CodingKeys: String, CodingKey {
        case homeStore = "home_store"
        case bestSeller = "best_seller"
    }
}
