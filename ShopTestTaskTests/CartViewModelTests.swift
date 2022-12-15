//
//  CartViewModelTests.swift
//  ShopTestTaskTests
//
//  Created by Vladimir Berezin on 15.12.22.
//

import XCTest
@testable import ShopTestTask

final class CartViewModelTests: XCTestCase {

    var cartViewModel: CartViewModel?
    let mockNetworkService = NetworkServiceTest()

    override func setUpWithError() throws {
        cartViewModel = CartViewModel(networkService: mockNetworkService)
    }

    override func tearDownWithError() throws {
        cartViewModel = nil
    }

    func testCartDataNotNill() async throws {
        await cartViewModel?.fetchData()
        XCTAssertNotNil(cartViewModel?.cartData.value)
    }

    func testCartDataEqual() async throws {
        let cartData = try! await mockNetworkService.fetchCart()
        await cartViewModel?.fetchData()
        XCTAssertEqual(cartViewModel?.cartData.value?.id, cartData.id)
    }

}
