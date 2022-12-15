//
//  PhoneDetail.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 09.12.22.
//

import SwiftUI

struct PhoneDetail: Decodable {

    let cpu: String
    let camera: String
    let capacity: [String]
    let colorsString: [String]
    let id: String
    let imagesUrl: [String]
    let isFavorites: Bool
    let price: Double
    var rating: Double
    let sd: String
    let ssd: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera
        case capacity
        case colorsString = "color"
        case id
        case imagesUrl = "images"
        case isFavorites
        case price
        case rating
        case sd
        case ssd
        case title
    }

}

extension PhoneDetail {

    static var mock: Self {
        .init(cpu: "Exynos 990",
              camera: "108 + 12 mp",
              capacity: ["126", "252"],
              colorsString: ["#772D03", "#010035"],
              id: "3",
              imagesUrl: ["https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
                          "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg"],
              isFavorites: true,
              price: 1500,
              rating: 4.5,
              sd: "256 GB",
              ssd: "8 GB",
              title: "Galaxy Note 20 Ultra")
    }
}
