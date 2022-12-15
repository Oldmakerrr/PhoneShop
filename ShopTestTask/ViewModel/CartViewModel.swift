//
//  CartViewModel.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 10.12.22.
//

import SwiftUI

final class CartViewModel: ObservableObject {

    private let networkService: NetworkServicing
    @Published var cartData: Loadable<CartData> = .isLoading(last: nil)

    init(networkService: NetworkServicing = NetworkService.shared) {
        self.networkService = networkService
    }

    @MainActor
    func fetchData() async {
        do {
            let cartData = try await networkService.fetchCart()
            self.cartData = .loaded(cartData)
        } catch let error {
            cartData = .failed(error)
        }
    }
}
