//
//  MyCard.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 10.12.22.
//

import SwiftUI

struct MyCard: View {

    @StateObject var viewModel: CartViewModel
    @Binding var isPresented: Bool

    var body: some View {
        switch viewModel.cartData {
        case .loaded(let cartData):
            loadedContent(cartData)
        case .isLoading(last: _):
            ProgressView()
                .onTapGesture { isPresented.toggle() }
                .task { await viewModel.fetchData() }
        default:
            DefaultContentView(isPresented: $isPresented)
                .task { await viewModel.fetchData() }
        }
    }

    @ViewBuilder
    private func loadedContent(_ cartData: CartData) -> some View {
        VStack(alignment: .leading) {
            HStack {
                RoundedSquareButton(.assetImage(Constants.Image.arrowLeading), color: .darkBlue) {
                    isPresented.toggle()
                }
                Spacer()
                Text("Add address")
                    .fontMarkPro500(15)
                    .foregroundColor(.assetDarkBlue)
                RoundedSquareButton(.assetImage(Constants.Image.mapMarker), color: .orange)
            }
            .padding(.vertical)
            .padding(.horizontal, 36)
            Text("My Cart")
                .fontMarkPro700(35)
                .foregroundColor(.assetDarkBlue)
                .padding(.horizontal, 40)
                .padding(.bottom, 49)
            bottomSheet(cartData)
                .ignoresSafeArea()
        }
    }

    private func bottomSheet(_ cartData: CartData) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.assetDarkBlue)
            VStack {
                ScrollView {
                    ForEach(cartData.basket) { basket in
                        CartCell(basketStore: basket)
                    }
                }
                .padding(.top, 60)
                Spacer()
                separator
                titleAndPrice("Total", String(format: "$%.0f us", cartData.total))
                titleAndPrice("Delivery", cartData.delivery)
                separator
                Button {
                    print("Checkout..")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.assetOrange)
                            .frame(width: 326, height: 54)
                        Text("Checkout")
                            .fontMarkPro700(20)
                            .foregroundColor(.white)
                    }
                    .padding()
                }
            }
            .padding()
        }

    }

    private var separator: some View {
        Rectangle()
            .fill(Color.white.opacity(0.3))
            .frame(height: 1)
    }

    private func titleAndPrice(_ title: String,_ price: String) -> some View {
        HStack {
            Text(title)
                .fontMarkPro400(15)
                .foregroundColor(.white)
            Spacer()
            Text(price)
                .fontMarkPro700(15)
                .foregroundColor(.white)
        }
        .padding(6)
    }

}

struct MyCard_Previews: PreviewProvider {

    static var viewModel: CartViewModel {
        let networkService = NetworkServiceTest()
        return CartViewModel(networkService: networkService)
    }

    static var previews: some View {
        MyCard(viewModel: viewModel, isPresented: .constant(true))
    }
}
