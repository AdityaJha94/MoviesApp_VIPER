//
//  MovieListInteractor.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import RxSwift
class MovieListInteractor: BaseInteractor{
    
    let moviesManager = MoviesManager()
    
    
    var shouldReload = Variable<Bool>(false)
    
    var movieListResponse: MovieListResponse = MovieListResponse()
    var movieListObservableResponse: Variable<MovieListResponse>
    
    var errMsgObserver = Variable<String>("")
    
    
    override init() {
        
        movieListObservableResponse = Variable(movieListResponse)
    }
    
    //MARK:- savedCards
    open func getMoviesList(pageIndex: Int) {
        isLoadingObserver.value = true
        moviesManager.getMoviesList(pageIndex: pageIndex, { [weak self] (movieListResponse) in
             self?.isLoadingObserver.value = false
            self?.movieListObservableResponse.value = movieListResponse
            
        }) { (error) in
            self.isLoadingObserver.value = false
            if error.status_code != ErrorCode.nullData.rawValue{
                self.shouldReload.value = true
                self.errMsgObserver.value = error.status_message
            }
            
        }
}
}
