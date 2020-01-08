//
//  MovieListPresenter.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
class MovieListPresenter: BasePresenter {
    
    private unowned var _view: MovieListViewController
    private var _interactor: MovieListInteractor
    private var _wireframe: MovieListWireframe
    
  
//    var pageIndexInput : Int = 0
//    var topRecord : Int = 26
//    var isDataLoading = false
    
    // MARK: - Lifecycle -
    init(wireframe: MovieListWireframe, view: MovieListViewController, interactor: MovieListInteractor) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
        
        super.init(baseInteractor: _interactor, view: _view)
        
    }
}

// MARK: - Controller LifeCycle
extension MovieListPresenter : MovieListPresenterInterface{
    
    func viewDidLoad() {
        //setUpRxObservableControl()
    }
    
    func viewWillAppear(animated: Bool) {
        addCustomNavBar(_view.self, isCloseRequired: false, title: "Movie List", barTintColor: Color.navBarColor) {[weak self] in
            guard let strongSelf = self else { return }
            _ = strongSelf._view.navigationController?.popViewController(animated: true)
        }
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
        
        //Observe Pagination Response
//        _interactor.isMoreRequestDone.asObservable().subscribe(onNext: { [weak self] (element) in
//            guard let strongSelf = self else { return }
//
//            DispatchQueue.main.async {
//                if(element){
//                    strongSelf.reloadTableViewData()
//                }
//            }
//        }).disposed(by: disposeBag)
    }
    
    
    func reloadTableViewData(){
        
//        _view.sectionFooterHeightConstraint.constant = 0
//        _view.loaderView.isHidden = true
//        _view.bookmarksTableView.reloadData()
    }
    
}

extension MovieListPresenter{
    func getAllMovies(){
    //_interactor.fetchBookMarksAPI(pageIndexInput: pageIndexInput)
    }
    
    func refreshMovieList()  {
//        if(_interactor.hasMoreRows) {
//            pageIndexInput = pageIndexInput + 1
//            _interactor.refreshBookMarksListAPI( topRecord: topRecord, pageIndexInput: pageIndexInput)
//        }
    }
}

extension MovieListPresenter{
    //Pagination
    func callApiForPagination(){
        
//        if ((_view.bookmarksTableView.contentOffset.y + _view.bookmarksTableView.frame.size.height) >= _view.bookmarksTableView.contentSize.height)
//        {
//            if !isDataLoading && _interactor.isMoreRequestDone.value && (_interactor.hasMoreRows) {
//                isDataLoading = true
//                _view.loaderView.isHidden = false
//                _view.sectionFooterHeightConstraint.constant = 66
//                refreshBookMarksList()
//            }
//        }
    }
}

