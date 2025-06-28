//
//  MiniMCommerceTests.swift
//  MiniMCommerceTests
//
//  Created by Denidu Gamage on 2025-06-28.
//

import Testing
import XCTest
@testable import MiniMCommerce


struct MiniMCommerceTests {
    final class CartViewModelTests: XCTestCase {

        var cartViewModel: CartViewModel!
        var sampleProduct: Product!

        override func setUp() {
            super.setUp()
            cartViewModel = CartViewModel()
            sampleProduct = Product(
                id: 1,
                title: "Test Product",
                description: "A test product",
                price: 10.0,
                category: "Test",
                image: "",
                rating: Rates(rate: 4.5, count: 100)
            )
        }

        override func tearDown() {
            cartViewModel = nil
            sampleProduct = nil
            super.tearDown()
        }

        func testAddToCart() {
            cartViewModel.addToCart(product: sampleProduct)
            XCTAssertEqual(cartViewModel.items.count, 1)
            XCTAssertEqual(cartViewModel.items.first?.quantity, 1)
        }

        func testIncreaseQuantityWhenAddedTwice() {
            cartViewModel.addToCart(product: sampleProduct)
            cartViewModel.addToCart(product: sampleProduct)
            XCTAssertEqual(cartViewModel.items.count, 1)
            XCTAssertEqual(cartViewModel.items.first?.quantity, 2)
        }

        func testRemoveFromCart() {
            cartViewModel.addToCart(product: sampleProduct)
            let item = cartViewModel.items.first!
            cartViewModel.removeFromCart(item: item)
            XCTAssertTrue(cartViewModel.items.isEmpty)
        }

        func testUpdateQuantity() {
            cartViewModel.addToCart(product: sampleProduct)
            let item = cartViewModel.items.first!
            cartViewModel.updateQuantity(for: item, quantity: 5)
            XCTAssertEqual(cartViewModel.items.first?.quantity, 5)
        }

        func testTotalCalculation() {
            cartViewModel.addToCart(product: sampleProduct)
            cartViewModel.updateQuantity(for: cartViewModel.items.first!, quantity: 3)
            XCTAssertEqual(cartViewModel.total, 30.0)
        }

        func testClearCart() {
            cartViewModel.addToCart(product: sampleProduct)
            cartViewModel.clearCart()
            XCTAssertEqual(cartViewModel.items.count, 0)
        }
    }
}

