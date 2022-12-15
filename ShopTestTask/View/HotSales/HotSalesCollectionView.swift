//
//  HotSalesCollectionView.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

struct HotSalesCollectionView: View {

    private let homeStores: [HomeStore]

    init(homeStores: [HomeStore]) {
        self.homeStores = homeStores
    }

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                HeaderView(title: "Hot Sales", buttonTitle: "see more")
                TabView {
                    ForEach(homeStores) { homeStore in
                        HotSalesCell(homeStore: homeStore)
                            .padding(10)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            }
        }

    }
}

struct HotSalesCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesCollectionView(homeStores: [.mock, .mock, .mock, .mock])
    }
}
