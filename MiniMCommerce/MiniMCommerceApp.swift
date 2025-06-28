//
//  MiniMCommerceApp.swift
//  MiniMCommerce
//
//  Created by Denidu Gamage on 2025-06-28.
//

import SwiftUI

@main
struct MiniMCommerceApp: App {
    @StateObject var cartViewModel = CartViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ProductView()
            }
            .environmentObject(cartViewModel)
        }
    }
}

