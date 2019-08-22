//
//  APIManagerForSearch.swift
//  GithubAPISampleApp
//
//  Created by Shota Nishizawa on 2019/08/22.
//  Copyright © 2019 Shota Nishizawa. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol SearchRequestType: Request {
    
}

extension SearchRequestType {
    typealias Response = [SearchResultEntity]
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        guard (200..<300).contains(urlResponse.statusCode) else {
            throw ResponseError.unacceptableStatusCode(urlResponse.statusCode)
        }
        return object
    }
}

struct FetchRepositoryRequest: SearchRequestType {
    var userName: String
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/users/\(self.userName)/repos"
    }
    
    init(userName: String) {
        self.userName = userName
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> FetchRepositoryRequest.Response {
        return try decodeValue(object)
    }
}
