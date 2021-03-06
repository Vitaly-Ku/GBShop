//
//  Review.swift
//  GBShop
//
//  Created by Vit K on 21.01.2021.
//

import Foundation
import Alamofire

struct ReviewRequest: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    let path: Pathes.RawValue
    
    let id: Int?
    let productId : Int?
    let userId: Int?
    let text: String?
    var parameters: Parameters? {
        return [
            "id_comment" : id ?? 0,
            "id_product" : productId ?? 0,
            "id_user": userId ?? 0,
            "text": text ?? ""
        ]
    }
    
    enum Pathes : String{
        case addReview
        case removeReview
        case approveReview
    }
}
