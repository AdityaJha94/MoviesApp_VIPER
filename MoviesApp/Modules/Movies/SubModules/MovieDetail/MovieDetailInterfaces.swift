//
//  MovieDetailInterfaces.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
enum MovieDetailNavigationOption{
    
}

protocol MovieDetailWireframeInterface: WireframeInterface {
    func navigate(to: MovieDetailNavigationOption)
}

protocol MovieDetailViewInterface: ViewInterface {
}

protocol MovieDetailPresenterInterface: PresenterInterface {
}

protocol MovieDetailInteractorInterface: InteractorInterface {
    
}
