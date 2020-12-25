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
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegisterRequestFatory() -> RegisterRequestFactory {
        let errorParser = makeErrorParser()
        return Register(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogoutRequestFatory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeDataRequestFatory() -> ChangeDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeProductsRequestFactory() -> ProductsRequestFactory {
        let errorParser = makeErrorParser()
        return Products(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
