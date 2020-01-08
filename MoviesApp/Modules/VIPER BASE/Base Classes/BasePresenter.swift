//
//  BasePresenter.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BasePresenter {
    private var _baseInteractor: BaseInteractor
    private unowned var _view: BaseViewController
    let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle -
    init(baseInteractor: BaseInteractor, view: BaseViewController) {
        _baseInteractor = baseInteractor
        _view = view
        setUpRxBaseObservablesControls()
    }
    
    // MARK: - Set up Rx Base Observable Control
    fileprivate func setUpRxBaseObservablesControls() {
        _baseInteractor.primaryErrorMsgObserver
            .asObservable()
            .bind { [weak self] (errorMsg) in
                guard let strongSelf = self else { return }
                
                strongSelf._view.showToastMessage(errorMsg)
            }.disposed(by: disposeBag)
        
        _baseInteractor.secondaryErrorMsgObserver
            .asObservable()
            .bind { [weak self] (errorMsg) in
                guard let strongSelf = self else { return }
                
                strongSelf._view.showToastMessage(errorMsg)
            }.disposed(by: disposeBag)
        
        _baseInteractor.isLoadingObserver
            .asObservable()
            .bind {[weak self] (loader) in
                guard let strongSelf = self else { return }
                
                DispatchQueue.main.async {
                    if strongSelf._view != nil{
                        if loader {
                            strongSelf._view.showLoadingProgress()
                        } else{
                            strongSelf._view.hideLoadingProgress()
                        }
                    }
                }
            }.disposed(by: disposeBag)
    }
}
