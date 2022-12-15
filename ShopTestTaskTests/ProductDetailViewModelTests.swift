//
//  ProductDetailViewModelTests.swift
//  ShopTestTaskTests
//
//  Created by Vladimir Berezin on 15.12.22.
//

import XCTest
@testable import ShopTestTask

final class ProductDetailViewModelTests: XCTestCase {

    var productDetailViewModel: ProductDetailViewModel?
    let mockNetworkService = NetworkServiceTest()

    override func setUpWithError() throws {
        productDetailViewModel = ProductDetailViewModel(networkService: mockNetworkService)
    }

    override func tearDownWithError() throws {
        productDetailViewModel = nil
    }

    func testPhoneDetailNotNill() async throws {
        await productDetailViewModel?.fetchData()
        XCTAssertNotNil(productDetailViewModel?.phoneDetail.value)
    }

    func testPhoneDetailEqual() async throws {
        let phoneDetail = try! await mockNetworkService.fetchDetailInfo()
        await productDetailViewModel?.fetchData()
        XCTAssertEqual(productDetailViewModel?.phoneDetail.value?.title, phoneDetail.title)
    }

}
