//
//  HomeStore.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import Foundation

struct HomeStore: Identifiable, Decodable {
    let id: Int
    let title: String
    let subtitle: String
    let pictureUrl: String
    let isBuy: Bool
    let isNew: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case subtitle
        case pictureUrl = "picture"
        case isBuy = "is_buy"
        case isNew = "is_new"
    }

}

extension HomeStore {

    static var mock: Self {
        .init(id: 1,
              title: "Iphone 12",
              subtitle: "Súper. Mega. Rápido.",
              pictureUrl: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both",
              isBuy: true,
              isNew: nil)
    }
}
