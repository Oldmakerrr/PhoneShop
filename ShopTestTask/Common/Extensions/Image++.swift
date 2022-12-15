//
//  Image++.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

extension Image {

    func withColor(_ color: Color) -> some View {
        return self
            .renderingMode(.template)
            .foregroundColor(color)
    }

    func withSize(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        return self
            .resizable()
            .frame(width: width, height: height, alignment: alignment)
    }
    
}
