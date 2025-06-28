//
//  Product.swift
//  MiniMCommerce
//
//  Created by Denidu Gamage on 2025-06-28.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let category: String
    let image: String
    let rating: Rates
}

struct Rates: Codable{
    let rate: Double
    let count: Int
}

struct CartItem: Identifiable {
    let id: Int
    let product: Product
    var quantity: Int
}
