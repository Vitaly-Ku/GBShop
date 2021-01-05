//
//  LoginResult.swift
//  GBShop
//
//  Created by Vit K on 05.01.2021.
//

import Foundation

struct StandardResult: Codable {
    let result: Int
}

struct RegisterResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}
