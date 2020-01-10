//
//  BaseTargetType.swift
//  MoviesApp
//
//  Created by Adi on 1/9/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

public extension TargetType {
    var method: Moya.Method {
        return .get
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var validate: Bool {
        return true
    }
}
