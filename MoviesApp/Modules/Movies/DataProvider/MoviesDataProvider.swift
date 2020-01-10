//
//  MoviesDataProvider.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
protocol MoviesDataProvider{
    
    //Get Movie List
    func getMovieList(pageIndex: Int, with success:@escaping (MovieListResponse)->Void, with errorCode:@escaping (ErrorResponse)->Void)
}

