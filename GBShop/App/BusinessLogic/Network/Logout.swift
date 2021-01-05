//
//  Logout.swift
//  GBShop
//
//  Created by Vit K on 21.12.2020.
//

import Alamofire

//class Logout: AbstractRequestFactory {
//    let errorParser: AbstractErrorParser
//    let sessionManager: Session
//    let queue: DispatchQueue
////    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
//    let baseUrl = URL(string: "https://hidden-citadel-40476.herokuapp.com")!
//    
//    init(
//        errorParser: AbstractErrorParser,
//        sessionManager: Session,
//        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
//        self.errorParser = errorParser
//        self.sessionManager = sessionManager
//        self.queue = queue
//    }
//}
//
//extension Logout: LogoutRequestFactory {
//    func logout(id: Int, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
//        let requestModel = Exit(baseUrl: baseUrl, id: id)
//        self.request(request: requestModel, completionHandler: completionHandler)
//    }
//}
//
//extension Logout {
//    struct Exit: RequestRouter {
//        let baseUrl: URL
//        let method: HTTPMethod = .get
//        let path: String = "logout.json"
//        
//        let id: Int
//        var parameters: Parameters? {
//            return [
//                "id_user": id
//            ]
//        }
//    }
//}
