//
//  MovieFontsAndColors.swift
//  MoviesApp
//
//  Created by Aditya Jha on 08/01/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import UIKit


//MARK:- Color

struct Color {
   static let whiteColor = UIColor(hexString: "FFFFFF")
   static let blackColor = UIColor(hexString: "000000")
   static let navBarColor = UIColor(hexString: "3D3D3D")
   static let appMainColor = UIColor(hexString: "001914")
}

//MARK:- TMW Font

struct MovieFont {
//    static let bold = "Quicksand-Bold"
//    static let light = "Quicksand-Light"
//    static let medium = "Quicksand-Medium"
//    static let regular = "Quicksand-Regular"
    static let bold = "MyriadPro-Bold"
    static let light = "MyriadPro-Light"
    static let regular = "MyriadPro-Regular"
}


enum CustomeFont {
    case light(CGFloat)
    case bold(CGFloat)
    case regular(CGFloat)
}

func CustomFont(font:CustomeFont)->UIFont{
    switch font {
    case .light(let size):
        return UIFont(name: MovieFont.light, size: (Constants.DYNAMICFONTSIZE.SCALE_FACT_FONT * size))!
    case .bold(let size):
        return UIFont(name: MovieFont.bold, size: (Constants.DYNAMICFONTSIZE.SCALE_FACT_FONT * size))!
    case .regular(let size):
        return UIFont(name: MovieFont.regular, size: (Constants.DYNAMICFONTSIZE.SCALE_FACT_FONT * size))!
    }
}
