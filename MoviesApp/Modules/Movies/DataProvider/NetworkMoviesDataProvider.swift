//
//  NetworkMoviesDataProvider.swift
//  MoviesApp
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper
import Result

enum ErrorCode : Int{
    case JsonError = 1001,
    GenericError,
    ServerError,
    QrCodeError,
    DataConversionError,
    NetworkNotAvailableError,
    nullData
    
}

public class NetworkMoviesDataProvider: MoviesDataProvider {
    
    private let movieClient = MoyaProvider<MoviesApi>()
    
    static let nwDataprovider = NetworkMoviesDataProvider()
    
    
    //Get Movies List
    func getMovieList(pageIndex: Int, with success: @escaping (MovieListResponse) -> Void, with errorCode: @escaping (ErrorResponse) -> Void) {
        
        if !MovieUtil.isConnectedToInternet() {
            errorCode(ErrorResponse.convertToErrorResponse(ErrorCode.NetworkNotAvailableError.rawValue, error:"No internet"  ))
            return
        }
        
        movieClient.request(.MovieList(page: pageIndex)) {(result) in
            switch(result) {
                
            case .success(let response):
                
                do{
                    
                    let mappedResponse = try Mapper<MovieListResponse>().map(JSON: response.mapJSON() as! [String : Any])
        
                    if let responseData = mappedResponse{
                        success(responseData)
                    }
                
                }catch MoyaError.jsonMapping( _){
                    errorCode(ErrorResponse.convertToErrorResponse(ErrorCode.JsonError.rawValue, error:"JSON Mapping Error"))
                } catch let error{
                    errorCode(ErrorResponse.convertToErrorResponse(ErrorCode.GenericError.rawValue, error:error.localizedDescription));
                }
                break
                
               case .failure(let error):
               errorCode(ErrorResponse.convertToErrorResponse(error.response?.statusCode ?? ErrorCode.ServerError.rawValue, error:error.failureReason ?? "API failure"))
                break
            }
        }
    }
    
}
