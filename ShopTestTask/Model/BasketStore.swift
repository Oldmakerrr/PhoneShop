//
//  BasketStore.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 10.12.22.
//

import Foundation

struct BasketStore: Decodable, Identifiable {
    let id: Int
    let images: String
    let price: Double
    let title: String

}

extension BasketStore {

    static var mock: Self {
        .init(id: 1,
              images: "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg",
              price: 1500,
              title: "Galaxy Note 20 Ultra")
    }
}
