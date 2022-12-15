//
//  CircleImageButton.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 12.12.22.
//

import SwiftUI

struct CircleImageButton: View {
    
    private let image: Image
    private let foregroundColor: Color
    private let size: CGFloat
    private let didTap: (() -> Void)?

    init(image: Image,
         foregroundColor: Color = .assetOrange,
         size: CGFloat = 25,
         didTap: (() -> Void)? = nil
    ) {
        self.image = image
        self.foregroundColor = foregroundColor
        self.size = size
        self.didTap = didTap
    }

    var body: some View {
        Button(action: didTap ?? {}) {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: size)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 20)
                image
                    .resizable()
                    .frame(width: size - 14, height: size - 15)
                    .foregroundColor(foregroundColor)
            }
            .shadow(color: .black.opacity(0.15), radius: 10)
            .padding()
        }
    }
}

struct CircleImageButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageButton(image: Image(systemName: "heart"))
    }
}
