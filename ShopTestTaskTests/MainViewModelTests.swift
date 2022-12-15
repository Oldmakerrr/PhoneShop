//
//  ShopTestTaskTests.swift
//  ShopTestTaskTests
//
//  Created by Vladimir Berezin on 15.12.22.
//

import XCTest
@testable import ShopTestTask

final class MainViewModelTests: XCTestCase {

    var mainViewModel: MainViewModel?
    let mockNetworkService = NetworkServiceTest()

    override func setUpWithError() throws {
        mainViewModel = MainViewModel(networkService: mockNetworkService)
    }

    override func tearDownWithError() throws {
        mainViewModel = nil
    }

    func testBestSellersCount() async throws {
        let product = try! await mockNetworkService.fetchProducts()
        await mainViewModel?.fetchData()
        XCTAssertEqual(mainViewModel?.bestSellers.count, product.bestSeller.count)
    }

    func testHomeStoreCount() async throws {
        let product = try! await mockNetworkService.fetchProducts()
        await mainViewModel?.fetchData()
        XCTAssertEqual(mainViewModel?.homeStores.count, product.homeStore.count)
    }


}
