//
//  LoadingView.swift
//  MoviesApp
//
//  Created by Aditya Jha on 08/01/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    static let loaderHeight : CGFloat = 120.0
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    //MARK: - Activity Indicator
    // LoadingView.showLoader(type: 3, uiView: btnHide, yourFrame: CGRect(x:0.0, y:0.0, width:40.0, height:40.0))
    static func showLoader(type:Int , uiView: UIView,yourFrame: CGRect?
        ){
        switch type {
        case 1:
            showActivityIndicatoryWithbg(uiView: uiView)
        case 2:
            showActivityIndicatoryWithoutbg(uiView: uiView)
        case 3:
            showActivityIndicatoryOnControl(uiView: uiView, Frame: yourFrame!)
        default: break
        }
       
    }
    
    //TYPE 1
    static func showActivityIndicatoryWithbg(uiView: UIView ) {
        let container: UIView = UIView()
        //container.frame = uiView.bounds
        let height = Constants.DYNAMICFONTSIZE.SCREEN_HEIGHT - 64
        container.frame = CGRect(x: 0, y:0, width:Constants.DYNAMICFONTSIZE.SCREEN_WIDTH, height:height)
        container.tag = 7271
        //container.backgroundColor = UIColorFromHex(rgbValue: 0xefefef, alpha: 0.3)
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x:(Constants.DYNAMICFONTSIZE.SCREEN_WIDTH - loaderHeight) / 2, y:(height - loaderHeight) / 2, width:loaderHeight, height:loaderHeight)
        //loadingView.center = CGPoint(x:uiView.bounds.size.width / 2,y:uiView.bounds.size.height / 2);
        loadingView.backgroundColor = .clear
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        let gif = UIImage.gifImageWithName("app_loader2")
        let actInd = UIImageView(image: gif)
        actInd.frame = CGRect(x:0.0, y:0.0, width:60.0, height:60.0);
        actInd.center = CGPoint(x:loadingView.frame.size.width / 2,
                                y:loadingView.frame.size.height / 2);
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        uiView.bringSubviewToFront(container)
        actInd.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    //TYPE 2
    static func showActivityIndicatoryWithoutbg(uiView: UIView ) {
        let container: UIView = UIView()
        
        let height = Constants.DYNAMICFONTSIZE.SCREEN_HEIGHT - 64
        //let container = UIApplication.shared.keyWindow!
        //container.frame = CGRect(x:0.0, y:0.0, width:80.0, height:80.0);
        container.frame = CGRect(x:(Constants.DYNAMICFONTSIZE.SCREEN_WIDTH - loaderHeight) / 2, y:(height - loaderHeight) / 2, width:loaderHeight, height:loaderHeight)
        
        /*
        if uiView.frame.origin.y == 64 {
            container.center = CGPoint(x: UIScreen.main.bounds.width/2,y :UIScreen.main.bounds.height/2-64)//uiView.center
        }else{
        container.center = CGPoint(x: UIScreen.main.bounds.width/2,y :UIScreen.main.bounds.height/2)//uiView.center
        }
         */
        container.tag = 7271
        //container.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.3)
        container.clipsToBounds = true
        container.layer.cornerRadius = 10
        
//        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        let gif = UIImage.gifImageWithName("app_loader2")
        let actInd = UIImageView(image: gif)
        actInd.frame = CGRect(x:0.0, y:0.0, width:loaderHeight/2, height:loaderHeight/2);
//        actInd.activityIndicatorViewStyle =
//            UIActivityIndicatorViewStyle.gray
        actInd.center = CGPoint(x:container.frame.size.width / 2,y:container.frame.size.height / 2);
        
        //actInd.tag = 7271
        container.addSubview(actInd)
        
        uiView.addSubview(container)
        //uiView.bringSubview(toFront: container)
        actInd.startAnimating()
    }
    
    //TYPE 3
    static func showActivityIndicatoryOnControl(uiView: UIView, Frame:CGRect ) {

        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.tag = 7271
        actInd.frame = Frame//CGRect(x:0.0, y:0.0, width:40.0, height:40.0);
        actInd.style =
        UIActivityIndicatorView.Style.gray
       
        uiView.addSubview(actInd)
        actInd.startAnimating()
    }
    
    func showActivityIndicatoryView(uiView: UIView, Frame:CGRect ) {
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.tag = 7271
        actInd.frame = Frame//CGRect(x:0.0, y:0.0, width:40.0, height:40.0);
        actInd.style =
            UIActivityIndicatorView.Style.gray
        
        uiView.addSubview(actInd)
        actInd.startAnimating()
    }

    
   static func hideLoader(uiView:UIView) {
        //let container = UIApplication.shared.keyWindow!
        for view in uiView.subviews
        {
            if view.tag == 7271 {
                view.removeFromSuperview()
                UIApplication.shared.endIgnoringInteractionEvents()
                break
            }
        }
    }
}

func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    
    return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
}
