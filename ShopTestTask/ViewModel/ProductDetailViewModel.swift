//
//  ProductDetailViewModel.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 09.12.22.
//

import SwiftUI

final class ProductDetailViewModel: ObservableObject {

    private let networkService: NetworkServicing

    @Published var phoneDetail: Loadable<PhoneDetail> = .isLoading(last: nil)
    
    @Published var selectedOption: DetailOption = .shop
    @Published var selectedColor: String = ""
    @Published var selectedCapacity: String = ""

    @Published var isPresentedCartView: Bool = false

    init(networkService: NetworkServicing = NetworkService.shared) {
        self.networkService = networkService
    }

    @MainActor
    func fetchData() async {
        do {
            let phoneDetail = try await networkService.fetchDetailInfo()
            self.phoneDetail = .loaded(phoneDetail)
            selectedColor = phoneDetail.colorsString.first ?? ""
            selectedCapacity = phoneDetail.capacity.first ?? ""
        } catch let error {
            phoneDetail = .failed(error)
        }
    }

}

