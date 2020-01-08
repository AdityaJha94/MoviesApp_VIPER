//
//  CustomNavbar.swift
//  MoviesApp
//
//  Created by Aditya Jha on 08/01/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

typealias backHandler = ()  -> Void
typealias rightButtonHandler = (_ buttonTag : Int)  -> Void

public let RIGHTBUTTONTITLETAG = 0
public let RIGHTBUTTONHELPIMAGETAG = 1
/*
 //MARK: Button Tag Value for right navigation bar
 0 - Means Right button Title Handler
 1 - Means Right button image Handler
*/

func addCustomNavBar(_ self : UIViewController, isCloseRequired: Bool,  title: String, barTintColor:UIColor?, isTranslucent:Bool? = false ,hidesBackButton:Bool? = false,backhandler: @escaping backHandler)  {
    IQKeyboardManager.shared.enable = true
    self.navigationController?.setNavigationBarHidden(false, animated: false)
    // Set navigation bar background colour
    self.navigationController?.navigationBar.barTintColor = barTintColor ?? Color.whiteColor
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = isTranslucent ?? false
    self.navigationController?.navigationBar.tintColor = Color.blackColor
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: CustomFont(font: .regular(16.0)), NSAttributedString.Key.foregroundColor:Color.whiteColor]
    
    if #available(iOS 11, *) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK:- left item-back button
    let button = UIButton(frame: CGRect(x: -10, y: 0, width: 44, height: 44))
    //button.touchUp = { button in
    button.touchUpInside { _ in
        backhandler()
    }
    let barButton = UIBarButtonItem.init(customView: button)
    
    // MARK:- left item-title
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
    if hidesBackButton == true {
        label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
    } else {
        label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 44)
    }
    label.font = CustomFont(font: .regular(16.0))
    label.text = title.uppercased()
    label.textAlignment = .center
    label.textColor = Color.blackColor
    let labelButton = UIBarButtonItem.init(customView: label)
    
    if isCloseRequired {
        self.title = title.uppercased()
        let theImageView = UIImageView(image: UIImage(named:"ic_close")!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        theImageView.tintColor = UIColor.black
        button.setImage(theImageView.image, for: .normal)
        button.tintColor = UIColor.black
        label.textAlignment = .center
        
        if hidesBackButton == false {
            self.navigationItem.leftBarButtonItems = [barButton]
        }
    }else{
        button.contentMode = .left
        button.semanticContentAttribute = .forceLeftToRight
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.setImage(UIImage.init(named: "ic_navigation_back"), for: UIControl.State.normal)
        button.tintColor = UIColor.black
        
        if hidesBackButton == true {
            self.navigationItem.hidesBackButton = hidesBackButton ?? false
            self.navigationItem.title = title.uppercased()
            //self.navigationItem.leftBarButtonItems = [labelButton]
        } else {
            if #available(iOS 11, *) {
                self.navigationItem.leftBarButtonItems = [barButton]
                self.navigationItem.title = label.text?.uppercased()
            }else{
                //self.navigationItem.leftBarButtonItems = [barButton,labelButton]
                self.navigationItem.leftBarButtonItems = [barButton]
                self.navigationItem.title = label.text?.uppercased()
            }
        }
    }
}
