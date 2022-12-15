//
//  MainViewModel.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import SwiftUI

final class MainViewModel: ObservableObject {

    private let networkService: NetworkServicing

    @Published var homeStores = [HomeStore]()
    @Published var bestSellers = [BestSeller]()
    @Published var categories: [Category] = Category.mock

    @Published var searchedText: String = "" {
        didSet { print(searchedText) }
    }

    @Published var selectedCategory: Category = .phones
    @Published var selectedBrand: String = "Samsung"

    @Published var detailViewIsPresented: Bool = false
    @Published var showingPopup = false
    
    var brands: [String] {
        return homeStores.compactMap { $0.title.components(separatedBy: " ").first }
    }

    init(networkService: NetworkServicing = NetworkService.shared) {
        self.networkService = networkService
    }

    @MainActor
    func fetchData() async {
        do {
            let products = try await networkService.fetchProducts()
            homeStores = products.homeStore
            bestSellers = products.bestSeller
        } catch let error {
            print(error.localizedDescription)
        }
    }

}
