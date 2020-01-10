//
//  MoviesManager.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import RxSwift
import Moya

public class MoviesManager{
    
    private let dataProvider = NetworkMoviesDataProvider.nwDataprovider
    
    //Get Movie List
    func getMoviesList(pageIndex: Int, _ success:@escaping (MovieListResponse)->Void, with errorCode:@escaping (ErrorResponse)->Void){
        
        dataProvider.getMovieList(pageIndex: pageIndex, with: { (movieList) in
            success(movieList)
        }) { (error) in
            errorCode(error)
        }
}
}
