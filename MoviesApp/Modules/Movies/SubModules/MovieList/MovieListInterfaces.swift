//
//  MovieListInterfaces.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation

enum MovieListNavigationOption{
    case movieDetail(movie: Movie)
}

protocol MovieListWireframeInterface: WireframeInterface {
    func navigate(to option: MovieListNavigationOption)
}

protocol MovieListViewInterface: ViewInterface {
}

protocol MovieListPresenterInterface: PresenterInterface {
}

protocol MovieListInteractorInterface: InteractorInterface {
}
