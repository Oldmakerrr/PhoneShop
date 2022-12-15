//
//  CategoryView.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

struct CategoryView: View {
    
    @Binding private var categories: [Category]
    @Binding private var selectedCategory: Category

    init(categories: Binding<[Category]>,
         selectedCategory: Binding<Category>
    ) {
        self._categories = categories
        self._selectedCategory = selectedCategory
    }

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Select Category", buttonTitle: "view all")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(categories) { category in
                        CategoryCell(category: category, isSelected: selectedCategory == category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding()
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(categories: .constant(Category.mock),
                     selectedCategory: .constant(.phones))
    }
}
