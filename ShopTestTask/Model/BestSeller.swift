//
//  BestSeller.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import Foundation

struct BestSeller: Identifiable, Decodable {
    let id: Int
    let title: String
    let pictureUrl: String
    let discountPrice: Double
    let priceWithoutDiscount: Double
    var isFavorites: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case pictureUrl = "picture"
        case discountPrice = "price_without_discount"
        case priceWithoutDiscount = "discount_price"
        case isFavorites = "is_favorites"
    }
}

extension BestSeller {

    static var mock: Self {
        .init(id: 1, title: "Samsung Galaxy s20 Ultra",
              pictureUrl: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg",
              discountPrice: 1047,
              priceWithoutDiscount: 1500,
              isFavorites: true)
    }
}
