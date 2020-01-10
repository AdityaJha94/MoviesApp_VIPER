//
//  MovieDetailWireframe.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailWireframe : BaseWireframe  {
    // MARK: - Private properties -
    private let _storyboard = UIStoryboard(name: "Movie", bundle: nil)
    
    init(movie: Movie) {
        let moduleViewController = _storyboard.instantiateViewController(ofType: MovieDetailViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter(wireframe: self, view: moduleViewController, interactor: interactor, movie: movies)
        moduleViewController.presenterObj = presenter
        moduleViewController.presenterInterface = presenter
    }
}
