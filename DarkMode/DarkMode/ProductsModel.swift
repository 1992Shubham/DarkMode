//
//  ProductsModel.swift
//  EcommerceAppUI
//
//  Created by SHUBHAM AGARWAL on 06/02/21.
//

import Foundation

struct ProductModel: Codable {
    var response: Product?
}

struct Product: Codable {
    var categoryName: String?
    var products: [ProductDetails]?
}

struct ProductDetails: Codable {
    var name: String?
    var imageName: String?
    var price: String?
    var description: String?
}
