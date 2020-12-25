//
//  RequestFactories.swift
//  GBShop
//
//  Created by Vit K on 21.12.2020.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

protocol LogoutRequestFactory {
    func logout(id: Int, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

protocol RegisterRequestFactory {
    func registration(userName: String, password: String, email : String, gender: String, cardNumber: String, comment: String, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void)
}

protocol ChangeDataRequestFactory {
    func changeData(userName: String, password: String, email : String, gender: String, cardNumber: String, comment: String, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void)
}

protocol ProductsRequestFactory {
    func catalogData(categoryId: Int, pageNumber: Int, completionHandler: @escaping (AFDataResponse<ProductsResult>) -> Void)
}
