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
    static func isConnectedToInternet() ->Bool {
        if NetworkReachabilityManager()!.isReachable {
            return NetworkReachabilityManager()!.isReachable
        }else{
            return NetworkReachabilityManager()!.isReachable
        }
        
    }
}





