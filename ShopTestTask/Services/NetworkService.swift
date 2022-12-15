//
//  NetworkService.swift
//  ShopTestTask
//
//  Created by Vladimir Berezin on 08.12.22.
//

import Foundation

protocol NetworkServicing: AnyObject {
    func fetchProducts() async throws -> Product
    func fetchDetailInfo() async throws -> PhoneDetail
    func fetchCart() async throws -> CartData
}

class NetworkService: NetworkServicing {

    static let shared = NetworkService()

    func fetchProducts() async throws -> Product {
        try await fetchData(url: Constants.URLConstant.productUrl)
    }

    func fetchDetailInfo() async throws -> PhoneDetail {
        try await fetchData(url: Constants.URLConstant.particularPhoneUrl)
    }

    func fetchCart() async throws -> CartData {
        try await fetchData(url: Constants.URLConstant.cartDataUrl)
    }

    private func fetchData<T: Decodable>(url: URL) async throws -> T {
        let result = try await URLSession.shared.data(from: url)
        return try parseJson(data: result.0)
    }

    private func parseJson<T: Decodable>(data: Data) throws -> T {
        let product = try JSONDecoder().decode(T.self, from: data)
        return product
    }
}

class NetworkServiceTest: NetworkServicing {
    func fetchDetailInfo() async throws -> PhoneDetail {
        .mock
    }

    func fetchCart() async throws -> CartData {
        .mock
    }

    func fetchProducts() async throws -> Product {
        Product(homeStore: [.mock, .mock, .mock], bestSeller: [.mock, .mock])
    }

}
