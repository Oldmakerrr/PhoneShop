//
//  RoundedSquareButton.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 09.12.22.
//

import SwiftUI

struct RoundedSquareButton: View {

    enum ContentType {
        case assetImage(String)
        case systemImage(String)
        case title(String)
    }

    enum Theme {
        case darkBlue
        case orange
    }

    private let content: ContentType
    private let size: CGFloat
    private let colorTheme: Theme
    private let didTap: (() -> Void)?

    private let foregroundColor: Color = .white

    private var backgroundColor: Color {
        switch colorTheme {
        case .darkBlue:
            return .assetDarkBlue
        case .orange:
            return .assetOrange
        }
    }

    init(_ content: ContentType,
         color: Theme,
         size: CGFloat = 37,
         didTap: (() -> Void)? = nil
    ) {
        self.content = content
        self.colorTheme = color
        self.size = size
        self.didTap = didTap
    }

    var body: some View {
        Button(action: didTap ?? {}) {
            switch content {
            case .title(_):
                contentView
            default:
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(backgroundColor)
                        .frame(width: size, height: size)
                    contentView
                }
            }
        }
    }

    @ViewBuilder
    private var contentView: some View {
        switch content {
            case .assetImage(let name):
                Image(name)
                    .withColor(foregroundColor)
            case .systemImage(let systemName):
                Image(systemName: systemName)
                    .withColor(foregroundColor)
            case .title(let title):
                Text(title)
                    .font(Font.system(size: 18, weight: .light))
                    .padding(.horizontal)
                    .foregroundColor(foregroundColor)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(backgroundColor)
                            .frame(height: size)
                    )
        }
    }

}



struct RoundedSquareButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RoundedSquareButton(.systemImage("xmark"), color: .orange)
            RoundedSquareButton(.assetImage(Constants.Image.books), color: .darkBlue)
            RoundedSquareButton(.title("sdfsd"), color: .darkBlue)
        }
    }
}
