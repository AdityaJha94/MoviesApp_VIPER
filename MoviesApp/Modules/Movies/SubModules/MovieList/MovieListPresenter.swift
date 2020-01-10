//
//  MovieListPresenter.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import UIKit
class MovieListPresenter: BasePresenter {
    
    //MARK:- Class Variables
    private unowned var _view: MovieListViewController
    private var _interactor: MovieListInteractor
    private var _wireframe: MovieListWireframe
    
    var movies: [Movie] = [Movie]()
    var page: Int = 1
    var total_pages: Int = 1
    var isDataLoading = false

    
    // MARK: - Lifecycle -
    init(wireframe: MovieListWireframe, view: MovieListViewController, interactor: MovieListInteractor) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
        
        super.init(baseInteractor: _interactor, view: _view)
        
    }
}

// MARK: - View Controller LifeCycle Methods
extension MovieListPresenter : MovieListPresenterInterface{
    
    func viewDidLoad() {
        setUpRxObservableControl()
    }
    
    func viewWillAppear(animated: Bool) {
        addCustomNavBar(_view.self, isCloseRequired: false, title: "Movies", barTintColor: Color.navBarColor) {[weak self] in
            guard let strongSelf = self else { return }
            _ = strongSelf._view.navigationController?.popViewController(animated: true)
        }
    }
    
    func viewDidAppear(animated: Bool) {
        
    }
    
    //MARK:- RXObservable Methods
    func setUpRxObservableControl(){
        
//        //Observe MovieListResponse
//        _interactor.movieListObservableResponse
//            .asObservable()
//            .bind {[weak self] (movieListResponse) in
//                guard let strongSelf = self else { return }
//                DispatchQueue.main.async {
//                    strongSelf.movies = movieListResponse.results
//                    if strongSelf.movies.count > 0{
//                        strongSelf.updateUIBasedOnMovieData()
//                    }
//                }
//         }.disposed(by: disposeBag)
        
        self._interactor.errMsgObserver.asObservable()
            .bind { [weak self] (errorMsg) in
                guard let strongSelf = self else { return }
                
                if errorMsg != "" {
                    DispatchQueue.main.async {
                        //Handle error here
//                        strongSelf._view.view.makeToast(errorMsg, duration: 3.0, position: .center)
                    }
                }
            }.disposed(by: disposeBag)
        
        //Observe Listing Response
        _interactor.shouldReload.asObservable().subscribe(onNext: { [weak self] (element) in
            
            DispatchQueue.main.async {
                if(element){
                    self?.movies = (self?._interactor.movies)!
                    self?.updateUIBasedOnMovieData()
                }
            }
        }).disposed(by: disposeBag)
        
        _interactor.isMoreRequestDone.asObservable().subscribe(onNext: { [weak self] (element) in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                if(element){
                    //_interactor.beneficiaryResponse
                    strongSelf.reloadTableViewData()
                }
            }
        }).disposed(by: disposeBag)
        

    }
    
    
    func reloadTableViewData(){
        
        _view.sectionFooterHeightConstraint.constant = 0
        _view.loaderView.isHidden = true
        _view.movieListTableView.reloadData()
    }
    
}


//MARK:- API functions
extension MovieListPresenter{
    func getAllMovies(pageIndex: Int){
        _interactor.getMoviesList(pageIndex: pageIndex)
    }
    
    func refreshMovieList()  {
        if (_interactor.hasMoreRows) {
            page = page + 1
            _interactor.refreshMovieListAPI(pageIndex: page)
        }
    }
}

//MARK:- Pagination required Setup method
extension MovieListPresenter{
    //Pagination
    func callApiForPagination(){
        if ((_view.movieListTableView.contentOffset.y + _view.movieListTableView.frame.size.height) >= _view.movieListTableView.contentSize.height)
        {
            if !isDataLoading && _interactor.isMoreRequestDone.value && _interactor.hasMoreRows {
                isDataLoading = true
                _view.loaderView.isHidden = false
                _view.sectionFooterHeightConstraint.constant = 66
                refreshMovieList()
            }
        }
    }
}

//MARK:- Redirection Method
extension MovieListPresenter{
    func navigateToMovieDetail(movie: Movie){
        _wireframe.navigate(to: .movieDetail(movie: movie))
    }
}



extension MovieListPresenter{
    func updateUIBasedOnMovieData(){
        if self.movies.count > 0{
            _view.movieListTableView.reloadData()
            _view.movieListTableView.isHidden = false
        }else{
            //handle No data screen here
        }

    }
}

