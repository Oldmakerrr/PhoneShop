//
//  CartData.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 10.12.22.
//

import Foundation

struct CartData: Decodable {
    var basket: [BasketStore]
    let delivery: String
    let id: String
    let total: Double

}

extension CartData {

    static var mock: Self {
        .init(basket: [.mock, .mock], delivery: "Free", id: "4", total: 3300)
    }
}
