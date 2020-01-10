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
    
    //Rx Variables
    var isMoreRequestDone = Variable<Bool>(true)
    var shouldReload = Variable<Bool>(false)
    var hasMoreRows : Bool = false
    var errMsgObserver = Variable<String>("")

    var movies: [Movie] = [Movie]()
    
    //MARK:- Get Movie List
    open func getMoviesList(pageIndex: Int) {
        isLoadingObserver.value = true
        moviesManager.getMoviesList(pageIndex: pageIndex, { [weak self] (movieListResponse) in
            self?.isLoadingObserver.value = false
            //self?.movieListObservableResponse.value = movieListResponse
            
            if let totalRecords = movieListResponse.total_pages {
                if totalRecords == pageIndex{
                    self?.hasMoreRows = false
                }else{
                    self?.hasMoreRows = true
                }
                
            }
            //New Code
            if pageIndex == 0 {
                if let moviesResponse = self?.movies, moviesResponse.count > 0 {
                    self?.movies.removeAll()
                }
            }
            self?.movies.append(contentsOf: movieListResponse.results)
            //New Code
            
            self?.shouldReload.value = true
            
        }) { (error) in
            self.isLoadingObserver.value = false
            if error.status_code != ErrorCode.nullData.rawValue{
                self.shouldReload.value = true
                self.errMsgObserver.value = error.status_message
            }
            
        }
    }
    
    //MARK:- Refresh Movie List API for Pagination
    public func refreshMovieListAPI(pageIndex: Int){
        self.isMoreRequestDone.value = false
        
        //let userId = TMWUserHelper.getUserInfo().UserId ?? 0
        moviesManager.getMoviesList(pageIndex: pageIndex, { [weak self] (movieListResponse) in
            self?.isMoreRequestDone.value = true
            
            
            if let totalRecords = movieListResponse.total_pages {
                if totalRecords == pageIndex{
                    self?.hasMoreRows = false
                }else{
                    self?.hasMoreRows = true
                }
            }
            
            self?.movies.append(contentsOf: movieListResponse.results)
            self?.shouldReload.value = true
            //success(BeneficiaryList)
        }) { [weak self](error) in
            self?.isMoreRequestDone.value = true
            self?.shouldReload.value = true
            if error.status_code != ErrorCode.nullData.rawValue{
                self?.errMsgObserver.value = error.status_message
            }
        }
    }
}
