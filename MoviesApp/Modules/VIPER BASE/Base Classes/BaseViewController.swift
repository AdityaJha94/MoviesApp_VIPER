//
//  BaseViewController.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import UIKit
import RxSwift

enum LoaderType : Int {
    case BLOCKING_UI = 1,
    NONBLOCKING_UI = 2,
    INSIDE_VIEW_LOADER = 3
}

protocol ControllerInit {
    var loaderType: LoaderType { get }
}

extension ControllerInit {
    var loaderType: LoaderType {
        return LoaderType.BLOCKING_UI
    }
}

class BaseViewController: UIViewController {
    fileprivate let disposeBag = DisposeBag()
    
    var _loaderType: LoaderType = LoaderType.BLOCKING_UI
    
    override func viewDidLoad() {
        //navigationController?.delegate = self
        //self.transitioningDelegate = self
        
        if let controller = self as? ControllerInit {
            _loaderType = controller.loaderType
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

// MARK: Implemented View Interface Protocol
extension BaseViewController : ViewInterface {
    
    // MARK: Show Toast Message
    func showToastMessage(_ errorMessage: String?) {
        if let errorMessage = errorMessage, errorMessage.trim().count > 0 {
            DispatchQueue.main.async {
                //self.view.makeToast(errorMessage, duration: 3.0, position: .center)
            }
        }
    }
    
    // MARK: Show Loading Progress View
    func showLoadingProgress() {
        LoadingView.showLoader(type: _loaderType.rawValue, uiView: self.view, yourFrame: nil)
    }
    
    // MARK: Hide Loading Progress View
    func hideLoadingProgress() {
        LoadingView.hideLoader(uiView: self.view)
    }
    
   
}
