//
//  CartViewModel.swift
//  MiniMCommerce
//
//  Created by Denidu Gamage on 2025-06-28.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = []

    var total: Double {
        items.reduce(0) { $0 + $1.product.price * Double($1.quantity) }
    }

    func addToCart(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(id: product.id, product: product, quantity: 1))
        }
    }

    func removeFromCart(item: CartItem) {
        items.removeAll { $0.id == item.id }
    }

    func updateQuantity(for item: CartItem, quantity: Int) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].quantity = quantity
        }
    }

    func clearCart() {
        items.removeAll()
    }
}
