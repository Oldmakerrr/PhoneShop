//
//  Category.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import Foundation

struct Category: Identifiable, Equatable {
    var id = UUID().uuidString
    let title: String
    let picture: String
}

extension Category {

    static var phones: Self {
        .init(title: "Phones", picture: "phone")
    }

    static var computers: Self {
        .init(title: "Computers", picture: "computer")
    }

    static var health: Self {
        .init(title: "Health", picture: "health")
    }

    static var books: Self {
        .init(title: "Books", picture: "books")
    }

    static var mock: [Category] {
        .init([.phones, .computers, .health, .books])
    }
}
