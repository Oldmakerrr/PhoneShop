//
//  ProductDetail.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 09.12.22.
//

import SwiftUI

struct ProductDetail: View {

    @StateObject var viewModel: ProductDetailViewModel
    @Binding var isPresented: Bool

    var body: some View {
        switch viewModel.phoneDetail {
        case .isLoading(last: _):
            ProgressView()
                .onTapGesture { isPresented.toggle() }
                .task { await viewModel.fetchData() }
        case .loaded(let phoneDetail):
            loadedContent(phoneDetail)
        default:
            DefaultContentView(isPresented: $isPresented)
                .task { await viewModel.fetchData() }
        }
    }

    private func loadedContent(_ phoneDetail: PhoneDetail) -> some View {
        VStack {
            HStack(spacing: 50) {
                RoundedSquareButton(.assetImage(Constants.Image.arrowLeading), color: .darkBlue) {
                    isPresented.toggle()
                }
                Text("Product Details")
                    .fontMarkPro500(18)
                    .foregroundColor(.assetDarkBlue)
                RoundedSquareButton(.assetImage(Constants.Image.laptop), color: .orange) {
                    viewModel.isPresentedCartView.toggle()
                }
                .fullScreenCover(isPresented: $viewModel.isPresentedCartView, content: {
                    MyCard(viewModel: CartViewModel(),
                           isPresented: $viewModel.isPresentedCartView )
                })
            }
            ImageCarousel(images: phoneDetail.imagesUrl)
                .frame(width: 270)
                .offset(y: 20)
            ProductDetailBottomSheet(selectedOption: $viewModel.selectedOption,
                                     phoneDetail: phoneDetail,
                                     selectedCapacity: $viewModel.selectedCapacity,
                                     selectedColor: $viewModel.selectedColor)
            .offset(y: 35)
            .shadow(color: .black.opacity(0.1), radius: 10)
        }
        .background(Color.assetLightGray)
    }

}

struct ProductDetail_Previews: PreviewProvider {

    static var viewModel: ProductDetailViewModel {
        let networkService = NetworkServiceTest()
        return ProductDetailViewModel(networkService: networkService)
    }

    static var previews: some View {
        ProductDetail(viewModel: viewModel, isPresented: .constant(true))
    }
}
