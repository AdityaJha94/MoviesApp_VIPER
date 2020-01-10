//
//  MovieDetailPresenter.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import Foundation
class MovieDetailPresenter: BasePresenter {
    
    private unowned var _view: MovieDetailViewController
    private var _interactor: MovieDetailInteractor
    private var _wireframe: MovieDetailWireframe
    
    var movie: Movie?

  
//    var pageIndexInput : Int = 0
//    var topRecord : Int = 26
//    var isDataLoading = false
    
    // MARK: - Lifecycle -
    init(wireframe: MovieDetailWireframe, view: MovieDetailViewController, interactor: MovieDetailInteractor, movie: Movie) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
        
        self.movie = movie
        
        super.init(baseInteractor: _interactor, view: _view)
        
    }
}

// MARK: - Controller LifeCycle
extension MovieDetailPresenter : MovieDetailPresenterInterface{
    
    func viewDidLoad() {
        //setUpRxObservableControl()
    }
    
    func viewWillAppear(animated: Bool) {

//        addCustomNavBar(_view.self, isCloseRequired: false, title: "Movie Detail", barTintColor: Color.navBarColor) {[weak self] in
//            guard let strongSelf = self else { return }
//            _ = strongSelf._view.navigationController?.popViewController(animated: true)
//        }
//        addCustomNavBar(_view.self, isCloseRequired: false, isBalanceRequired: false, title: Localization("lbl_bookmark"), barTintColor: Color.whiteColor) {[weak self] in
//            guard let strongSelf = self else { return }
//            _ = strongSelf._view.navigationController?.popViewController(animated: true)
//        }
    }
    
    func viewDidAppear(animated: Bool) {
        
    }
    
    func setUpRxObservableControl(){
//        _interactor.shouldReload.asObservable().subscribe(onNext: { [weak self] (element) in
//            guard let strongSelf = self else { return }
//
//            DispatchQueue.main.async {
//                if(element){
//                    if(strongSelf._interactor.bookMarkATMResponse.count == 0) {
//                        strongSelf.bookMarkATMResponse = strongSelf._interactor.bookMarkATMResponse
//                        strongSelf._view.bookmarksTableView.isHidden = false
//                        strongSelf._view.bookmarksTableView.backgroundView?.isHidden = false
//                        strongSelf._view.setupBookMarkEmptyView(statusCode: ((self?._interactor.statusCode)!), statusMessage: ((self?._interactor.statusMessage)!)) // when no bookmark present empty view.
//                    } else {
//                        strongSelf.bookMarkATMResponse = strongSelf._interactor.bookMarkATMResponse
//                        strongSelf._view.bookmarksTableView.isHidden = false
//                        strongSelf._view.bookmarksTableView.backgroundView?.isHidden = true
//                        strongSelf._view.bookmarksTableView.reloadData()
//                        //strongSelf._view.reminderSettingsTableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
//                    }
//
//                }
//            }
        //}).disposed(by: disposeBag)
        
    }
    
}

extension MovieListPresenter{
    func getMovieDetail(){
    //_interactor.fetchBookMarksAPI(pageIndexInput: pageIndexInput)
    }
}

