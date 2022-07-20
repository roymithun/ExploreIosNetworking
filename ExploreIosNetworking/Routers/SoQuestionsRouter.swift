//
//  SoQuestionsRouter.swift
//  ExploreNetworking
//
//  Created by Mithun Roy on 20/07/2022.
//

import Foundation
import Alamofire

enum SoQuestionsRouter {
    case questions(site: String)
    
    var baseUrl: URL {
        URL(string: "https://api.stackexchange.com")!
    }
    
    var path: String {
        switch self {
        case .questions:
            return "2.3/questions"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .questions:
            return .get
        }
    }
    
    var paramters: [String : String] {
        switch self {
        case let .questions(site: site):
            return ["site" : site]
        }
    }
}

// MARK: - URLRequestConvertible
extension SoQuestionsRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent)
            .encode(paramters, into: request)
        return request
    }
}
    
