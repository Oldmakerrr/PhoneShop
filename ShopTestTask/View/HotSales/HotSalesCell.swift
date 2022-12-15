//
//  HotSalesCell.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

struct HotSalesCell: View {
    
    private let homeStore: HomeStore
    private let didTap: (() -> Void)?

    init(homeStore: HomeStore,
         didTap: (() -> Void)? = nil
    ) {
        self.homeStore = homeStore
        self.didTap = didTap
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ZStack {
                    Circle()
                        .fill(Color.assetOrange)
                        .frame(height: 27)
                    Text("New")
                        .fontMarkPro700(10)
                        .foregroundColor(.white)
                }
                Spacer()
                Text(homeStore.title)
                    .fontMarkPro700(25)
                    .foregroundColor(.white)
                Text(homeStore.subtitle)
                    .fontMarkPro400(11)
                    .foregroundColor(.white)
                Spacer()
                Button(action: didTap ?? {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white)
                            .frame(width: 98, height: 23)
                        Text("Buy Now!")
                            .fontMarkPro700(11)
                            .foregroundColor(.assetDarkBlue)
                    }
                }
            }
            .padding(.leading, 25)
            .padding(.top, 14)
            .padding(.bottom, 26)
            Spacer()
        }
        .frame(height: 162)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                AsyncImage(url: .init(string: homeStore.pictureUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            }
        )
    }
}

struct HotSalesCell_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesCell(homeStore: .mock)
    }
}
