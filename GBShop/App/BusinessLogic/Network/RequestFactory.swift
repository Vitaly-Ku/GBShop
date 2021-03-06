//
//  RequestFactory.swift
//  GBShop
//
//  Created by Vit K on 21.12.2020.
//

import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeUserReviewsRequestFactory() -> UserReviewsRequestFactory {
        let errorParser = makeErrorParser()
        return UserReviews(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeManageReviewsRequestFactory() -> ManageReviewsRequestFactory {
        let errorParser = makeErrorParser()
        return ManageReviews(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeBasketRequestFactory() -> BasketRequestFactory {
        let errorParser = makeErrorParser()
        return Basket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeProductsRequestFactory() -> ProductsRequestFactory {
        let errorParser = makeErrorParser()
        return Products(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
