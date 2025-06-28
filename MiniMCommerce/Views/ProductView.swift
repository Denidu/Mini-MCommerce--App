//
//  ProductView.swift
//  MiniMCommerce
//
//  Created by Denidu Gamage on 2025-06-28.
//

import SwiftUI

struct ProductView: View {
    @StateObject private var productViewModel = ProductViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        List(productViewModel.product) { product in
            NavigationLink(destination: ProductDetailView(product: product)) {
                HStack(spacing: 16) {
                    AsyncImage(url: URL(string: product.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.systemGray5))
                            .overlay(ProgressView())
                    }
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(product.title)
                            .font(.headline)
                            .lineLimit(2)
                        
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Products")
        .onAppear {
            productViewModel.fetchProduct()
        }
        .toolbar {
            NavigationLink(destination: CartView()) {
                Image(systemName: "cart.fill")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    ProductView()
}
