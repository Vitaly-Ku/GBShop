//
//  Product.swift
//  GBShop
//
//  Created by Vit K on 25.12.2020.
//

import Foundation

struct Product: Codable {
    var id_product: Int
    var product_name: String
    var price: Int
    var quantity: Int?
}
