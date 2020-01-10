//
//  MoviesAppTests.swift
//  MoviesAppTests
//
//  Created by Adi on 1/7/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import XCTest
import Moya
import ObjectMapper

@testable import MoviesApp

class MoviesAppTests: XCTestCase {

    private let movieClient = MoyaProvider<MoviesApi>()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMovieListAPI(){
        let expectation = self.expectation(description: "testNewsListAPI")
        
        movieClient.request(.MovieList(page: 1)) {(result) in
            switch(result) {
                
            case .success(let response):
                
                do{
                    
                    let mappedResponse = try Mapper<MovieListResponse>().map(JSON: response.mapJSON() as! [String : Any])
                    
                    if let responseData = mappedResponse{
                        expectation.fulfill()
                    }
                    
                }catch MoyaError.jsonMapping( _){
                    XCTFail("JSON mapping failure")
                } catch let error{
                    XCTFail("API request/response failure")
                }
                break
                
            case .failure(let error):
                XCTFail("API request/response failure")
                break
            }
        }

        wait(for: [expectation], timeout: 5)
    }


}
