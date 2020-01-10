//
//  MovieListWireframe.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import UIKit

class MovieListWireframe : BaseWireframe  {
    // MARK: - Private properties -
    private let _storyboard = UIStoryboard(name: "Movie", bundle: nil)
    
    init() {
        let moduleViewController = _storyboard.instantiateViewController(ofType: MovieListViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenterObj = presenter
        moduleViewController.presenterInterface = presenter
    }
}

extension MovieListWireframe: MovieListWireframeInterface{
    func navigate(to option: MovieListNavigationOption) {
        switch option{
        case .movieDetail(let movie):
            openMovieDetail(movie: movie)
        }
    }
    
    func openMovieDetail(movie: Movie){
        let movieDetailWireframe = MovieDetailWireframe.init(movie: movie)
        navigationController?.pushWireframe(movieDetailWireframe)
    }
    
    
}
