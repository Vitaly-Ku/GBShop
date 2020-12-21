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
