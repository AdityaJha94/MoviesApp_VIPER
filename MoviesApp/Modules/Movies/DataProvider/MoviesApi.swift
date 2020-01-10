//
//  MoviesApi.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

public enum MoviesApi{
    case MovieList(page: Int)
}

struct MoviesApiAction {
    static let kGetMovieList = "trending/movie/week"
}


extension MoviesApi: TargetType{
    
    public var baseURL: URL {
        switch self {
        case .MovieList:
            return URL(string: KBaseUrl)!
        }
    }
    public var path: String {
        switch self {
        case .MovieList:
            return "/\(MoviesApiAction.kGetMovieList)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .MovieList:
            return .get
        }
        
    }
    
    public var task: Task {
        switch self {
        case .MovieList(let page):
            return .requestParameters(
                parameters: [
                    "api_key": KAPIKey,
                    "page": page,
                ],
                encoding: URLEncoding.default)
            
        }
    }
    
}

private extension String {
    var URLEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
}
