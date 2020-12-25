//
//  LoginResult.swift
//  GBShop
//
//  Created by Vit K on 21.12.2020.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
}

struct RegisterResult: Codable {
    let result: Int
    let userMessage: String
}

struct LogoutResult: Codable {
    let result: Int
}

struct ProductResult: Codable {
    let result: Int
    let errorMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case errorMessage = "error_message"
    }
}

struct ProductsResult: Codable {
    var pageNumber: Int
    var products: [Product]

    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products
    }
}
