//
//  CartCell.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 10.12.22.
//

import SwiftUI

struct CartCell: View {

    private let basketStore: BasketStore
    @State private var count: Int = 1

    init(basketStore: BasketStore) {
        self.basketStore = basketStore
    }

    var body: some View {
        HStack {
            AsyncImage(url: .init(string: basketStore.images)) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 90, height: 90)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(basketStore.title)
                    .fontMarkPro500(20)
                    .foregroundColor(.white)
                Text(String(format: "$%.2f", basketStore.price))
                    .fontMarkPro500(20)
                    .foregroundColor(.assetOrange)
            }
            Spacer()
            VStack {
                Group {
                    Button {
                        count -= count > 1 ? 1 : 0
                    } label: { Text("-").fontMarkPro500(20) }
                    Text(String(count)).fontMarkPro500(20)
                    Button {
                        count += 1
                    } label: { Text("+").fontMarkPro500(20) }
                }
                .font(Font.system(size: 20, weight: .regular))
                .foregroundColor(.white)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 26/2)
                    .fill(Color.assetGray)
                    .frame(width: 26, height: 74)
            )
            Button {

            } label: {
                Image(Constants.Image.trash)
            }
        }
    }
}

struct CartCell_Previews: PreviewProvider {
    static var previews: some View {
        CartCell(basketStore: .mock)
    }
}
