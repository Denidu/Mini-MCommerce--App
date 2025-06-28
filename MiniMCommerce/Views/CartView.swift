//
//  CartView.swift
//  MiniMCommerce
//
//  Created by Denidu Gamage on 2025-06-28.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            if cartViewModel.items.isEmpty {
                VStack(spacing: 16) {
                    Image(systemName: "cart")
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                    Text("Your cart is empty")
                        .font(.title2)
                        .fontWeight(.medium)
                    Text("To get started add some products" )
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    ForEach(cartViewModel.items) { item in
                        HStack(spacing: 12) {
                            AsyncImage(url: URL(string: item.product.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(.systemGray5))
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                            VStack(alignment: .leading, spacing: 6) {
                                Text(item.product.title)
                                    .font(.headline)
                                    .lineLimit(2)
                                
                                Text("$\(item.product.price, specifier: "%.2f") each")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)

                                HStack {
                                    Text("Qty:")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    Stepper("\(item.quantity)", value: Binding(
                                        get: { item.quantity },
                                        set: { newQty in
                                            cartViewModel.updateQuantity(for: item, quantity: newQty)
                                        }), in: 1...99)
                                    .labelsHidden()
                                }
                                
                                Text("Subtotal: $\(Double(item.quantity) * item.product.price, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                            }
                            
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete { indexSet in
                        indexSet.map { cartViewModel.items[$0] }.forEach(cartViewModel.removeFromCart)
                    }
                }
                .listStyle(PlainListStyle())
                
                VStack(spacing: 16) {
                    Divider()
                    
                    HStack {
                        Text("Total:")
                            .font(.title2)
                            .fontWeight(.medium)
                        Spacer()
                        Text("$\(cartViewModel.total, specifier: "%.2f")")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    
                    Button("Checkout") {
                        //checkout action
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color(.systemBackground))
            }
        }
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            if !cartViewModel.items.isEmpty {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Clear") {
                        cartViewModel.clearCart()
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    CartView()
}
