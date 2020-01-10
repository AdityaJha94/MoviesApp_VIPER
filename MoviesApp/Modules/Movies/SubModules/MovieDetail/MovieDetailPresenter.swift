//
//  MovieDetailPresenter.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation

class MovieDetailPresenter: BasePresenter {
    
    //MARK:- Class Variables
    private unowned var _view: MovieDetailViewController
    private var _interactor: MovieDetailInteractor
    private var _wireframe: MovieDetailWireframe
    
    var movie: Movie?

  
    // MARK: - Lifecycle -
    init(wireframe: MovieDetailWireframe, view: MovieDetailViewController, interactor: MovieDetailInteractor, movie: Movie) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
        
        self.movie = movie
        
        super.init(baseInteractor: _interactor, view: _view)
        
    }
}

// MARK: - View Controller LifeCycle Methods
extension MovieDetailPresenter : MovieDetailPresenterInterface{
    
    func viewDidLoad() {
        //setUpRxObservableControl()
    }
    
    func viewWillAppear(animated: Bool) {

    }
    
    func viewDidAppear(animated: Bool) {
        
    }
    
}


