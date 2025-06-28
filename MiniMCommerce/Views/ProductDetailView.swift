//
//  ProductDetailView.swift
//  MiniMCommerce
//
//  Created by Denidu Gamage on 2025-06-28.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var showAddedAlert = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray5))
                        .overlay(ProgressView())
                }
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 16) {
                    Text(product.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)

                    HStack {
                        Text(product.category.capitalized)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(6)
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.caption)
                            Text("\(product.rating.rate, specifier: "%.1f")")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            Text("(\(product.rating.count))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(4)
                    
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Button("Add to Cart") {
                        cartViewModel.addToCart(product: product)
                        showAddedAlert = true
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert("Added to Cart", isPresented: $showAddedAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("\(product.title) has been added to your cart")
        }
    }
}

