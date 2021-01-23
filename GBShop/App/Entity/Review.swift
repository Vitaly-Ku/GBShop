//
//  Review.swift
//  GBShop
//
//  Created by Vit K on 05.01.2021.
//

import Foundation

struct Review: Codable {
    var commentId: Int
    var productId: Int
    var userId: Int
    var text: String
    
    enum CodingKeys: String, CodingKey {
        case commentId = "id_comment"
        case productId = "id_product"
        case userId = "id_user"
        case text
    }
}

