//
//  ProductViewModel.swift
//  MiniMCommerce
//
//  Created by Denidu Gamage on 2025-06-28.
//

import Foundation
import Alamofire

class ProductViewModel: ObservableObject {
    @Published var product: [Product] = []
    
    func fetchProduct() {
        let urlString = "https://fakestoreapi.com/products"
        AF.request(urlString).validate().responseDecodable(of: [Product].self) { response in
            switch response.result {
                case .success(let products):
                self.product = products
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
    
}
