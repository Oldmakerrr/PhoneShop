//
//  MainView.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewModel: MainViewModel

    private let popupHeight: CGFloat = 430

    private var popupOfSetY: CGFloat {
        viewModel.showingPopup ? 35 : popupHeight
    }

    private let animateDuration: TimeInterval = 0.2

    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                HStack {
                    Image(Constants.Image.mapMarker)
                    Text("Zihuatanejo, Gro")
                        .fontMarkPro500(15)
                        .foregroundColor(.assetDarkBlue)
                    Button {
                        
                    } label: {
                        Image(Constants.Image.arrowDown)
                    }
                }
                HStack {
                    Spacer()
                    Button {
                        viewModel.showingPopup.toggle()
                    } label: {
                        Image(Constants.Image.filter)
                            .padding(.trailing, 35)
                    }
                }
            }
            .padding(.top, 10)
            CategoryView(categories: $viewModel.categories,
                         selectedCategory: $viewModel.selectedCategory)
            SearchView(searchedText: $viewModel.searchedText)
            ScrollView {
                HotSalesCollectionView(homeStores: viewModel.homeStores)
                    .frame(height: 220)
                BestSellerCollectionView(bestSellers: viewModel.bestSellers, didTap: {
                    viewModel.detailViewIsPresented.toggle()
                })
                .fullScreenCover(isPresented: $viewModel.detailViewIsPresented, content: {
                    ProductDetail(viewModel: ProductDetailViewModel(),
                                  isPresented: $viewModel.detailViewIsPresented)
                })
                .frame(height: 550)
            }
            MainFooterView()
        }
        .background(Color.assetLightGray)
        .overlay {
            VStack {
                Spacer()
                FilterView(isShowed: $viewModel.showingPopup,
                           selectedBrand: $viewModel.selectedBrand,
                           brands: viewModel.brands)
                .frame(width: UIScreen.main.bounds.width,
                       height: popupHeight)
                .offset(x: 0, y: popupOfSetY)
                .animation(.easeOut(duration: animateDuration),
                           value: popupOfSetY)
            }
            .ignoresSafeArea()
        }
        .task { await viewModel.fetchData() }
    }
}


struct MainView_Previews: PreviewProvider {

    static var viewModel: MainViewModel {
        let networkService = NetworkServiceTest()
        return MainViewModel(networkService: networkService)
    }

    static var previews: some View {
        MainView(viewModel: viewModel)
    }
}

