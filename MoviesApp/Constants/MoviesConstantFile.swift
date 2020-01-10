//
//  MoviesConstantFile.swift
//  MoviesApp
//
//  Created by Adi on 1/9/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import UIKit

let KBaseUrl = "https://api.themoviedb.org/3"
let KImageBaseUrl = "http://image.tmdb.org/t/p/w500"
let KAPIKey = "8eac22f4c24d01c480e4d99fef2edfc3"

struct Constants {
    
    struct DYNAMICFONTSIZE {
        static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
        static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
        
        static let IS_IPHONE_XR_XS_MAX = UIScreen.main.bounds.height == 896.0
        static let IS_IPHONE_X_XS = UIScreen.main.bounds.height == 812.0
        static let IS_IPHONE_6P = UIScreen.main.bounds.height == 736.0
        static let IS_IPHONE_6 = UIScreen.main.bounds.height == 667.0
        static let IS_IPHONE_5  = UIScreen.main.bounds.height == 568.0
        static let IS_IPHONE_4 = UIScreen.main.bounds.height == 480.0
        static let IPAD1_2_H  =  UIScreen.main.bounds.width == 1024.0
        static let IPAD3_H  =  UIScreen.main.bounds.width == 2048.0
        
        static var SCREEN_WIDTH = UIScreen.main.bounds.width
        static var SCREEN_HEIGHT = UIScreen.main.bounds.height
        static let BASE_FACTOR = 667.0
        static let BASE_FACTOR_WIDTH = 375.0
        
        static var SCALE_FACT_FONT : CGFloat  = (((IS_IPHONE_XR_XS_MAX) ? 1.15 : ((IS_IPHONE_X_XS) ? 1.05 : ((IS_IPHONE_6P) ? 1.10 : ((IS_IPHONE_6) ? 1.00 : ((IS_IPHONE_5) ? 0.85 : 1.00))))))
        
        static var SCALE_FACT_HEIGHT : CGFloat = SCREEN_HEIGHT / CGFloat(BASE_FACTOR)
        static var SCALE_FACT_IPHONE5 : CGFloat = 0.87
        static var SCALE_FACT_IPHONEX_FAMILY : CGFloat = 1.10
        static var SCALE_FACT_IPHONE5_FORM_LAYOUT : CGFloat = 0.93
        static var SCALE_FACT_WIDTH : CGFloat = SCREEN_WIDTH / CGFloat(BASE_FACTOR_WIDTH)
    }
}
