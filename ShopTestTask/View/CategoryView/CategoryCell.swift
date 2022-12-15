//
//  CategoryCell.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

struct CategoryCell: View {

    private let category: Category
    private var isSelected: Bool

    private var foregroundColor: Color {
        isSelected ? .white : .assetDarkGray
    }

    private var backgroundColor: Color {
        isSelected ? .assetOrange : .white
    }

    private var textColor: Color {
        isSelected ? .assetOrange : .assetDarkBlue
    }

    init(category: Category,
         isSelected: Bool
    ) {
        self.category = category
        self.isSelected = isSelected
    }

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: 71)
                Image(category.picture)
                    .withColor(foregroundColor)
            }
            Text(category.title)
                .fontMarkPro500(12)
                .foregroundColor(textColor)
        }
        .shadow(color: .black.opacity(0.1), radius: 10)
        .frame(minWidth: 80)
        .animation(.easeInOut(duration: 0.15), value: isSelected)
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(category: .health, isSelected: true)
    }
}
