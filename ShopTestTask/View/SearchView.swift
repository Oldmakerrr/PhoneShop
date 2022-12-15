//
//  SearchView.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

struct SearchView: View {

    @Binding private var searchedText: String

    private let height: CGFloat = 34
    private let didTap: (() -> Void)?

    init(searchedText: Binding<String>,
         didTap: (() -> Void)? = nil
    ) {
        self._searchedText = searchedText
        self.didTap = didTap
    }

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: height/2, style: .continuous)
                    .fill(Color.white)
                    .frame(height: height)
                HStack {
                    Image(Constants.Image.magnifyingglass)
                        .withColor(.assetOrange)
                    TextField("", text: $searchedText)
                        .placeholder(when: searchedText.isEmpty,
                                     placeholder: {
                            Text("Search")
                                .fontMarkPro400(12)
                                .foregroundColor(.assetDarkGray)
                        })
                }
                .padding()
            }
            .shadow(color: .black.opacity(0.1), radius: 10)
            Button(action: didTap ?? {}) {
                ZStack {
                    Circle()
                        .fill(Color.assetOrange)
                        .frame(height: height)
                    Image(Constants.Image.categories)
                        .withColor(.white)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchedText: .constant(""))
    }
}
