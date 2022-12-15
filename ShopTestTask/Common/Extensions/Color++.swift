//
//  Color++.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

extension Color {

    static let assetOrange = Color("Orange")
    static let assetDarkBlue = Color("DarkBlue")
    static let assetLightGray = Color("LightGray")
    static let assetDarkGray = Color("DarkGray")
    static let assetGray = Color("Gray")
}

extension Color {

    init(hexaString: String, opacity: CGFloat = 1) {
        let chars = Array(hexaString.dropFirst())
        self.init(red: .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue: .init(strtoul(String(chars[4...5]),nil,16))/255, opacity: opacity)

    }
}
