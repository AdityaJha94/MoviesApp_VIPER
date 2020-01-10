//
//  MovieUtil.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class MovieUtil{
    static func isConnectedToInternet() -> Bool {
        if NetworkReachabilityManager()!.isReachable {
            return NetworkReachabilityManager()!.isReachable
        }else{
            return NetworkReachabilityManager()!.isReachable
        }
        
    }
    
    static func getRequiredDateString(dateString: String, passedDateFormat: String, requiredDateFormat: String) -> String{
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = passedDateFormat
        let date = dateFormatter1.date(from: dateString)!
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = requiredDateFormat
        let requiredString = dateFormatter2.string(from: date)
        return requiredString
    }
}





