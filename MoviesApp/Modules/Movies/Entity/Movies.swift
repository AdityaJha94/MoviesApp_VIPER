//
//  Movies.swift
//  MoviesApp
//
//  Created by Adi on 1/9/20.
//  Copyright © 2020 Aditya. All rights reserved.
//

import Foundation

import ObjectMapper

public class MovieListResponse : Mappable {
    var page: Int?
    var results = [Movie]()
    var total_pages : Int?
    var total_results : Int?
    
    required public init?(map: Map){
        
    }
    init() {
        
    }
    public func mapping(map: Map) {
        page <- map["page"]
        results <- map["results"]
        total_pages <- map["total_pages"]
        total_results <- map["total_results"]
    }
}

public class Movie : Mappable {
    var id : CLongLong?
    var video : Bool?
    var vote_count : CLongLong?
    var vote_average : Double?
    var title : String?
    var release_date : String?
    var original_language : String?
    var original_title : String?
    var genre_ids : [Int]?
    var backdrop_path : String?
    var adult : Bool?
    var overview : String?
    var poster_path : String?
    var popularity : Int?
    var media_type : String?
    
    
    required public init?(map: Map){
        
    }
    init() {
        
    }
    public func mapping(map: Map) {
        id <- map["id"]
        video <- map["video"]
        vote_count <- map["vote_count"]
        vote_average <- map["vote_average"]
        title <- map["title"]
        release_date <- map["release_date"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        genre_ids <- map["genre_ids"]
        backdrop_path <- map["backdrop_path"]
        adult <- map["adult"]
        overview <- map["overview"]
        poster_path <- map["poster_path"]
        popularity <- map["popularity"]
        media_type <- map["media_type"]
    }
}


/*
struct MovieListResponse: Decodable {
    var page: Int?
    var results = [Movie]()
    var total_pages : Int?
    var total_results : Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page", results = "results", total_pages = "total_pages",total_results = "total_results"
    }
    
}

struct Movie: Decodable {
    var id : CLongLong?
    var video : Bool?
    var vote_count : CLongLong?
    var video_average : CLongLong?
    var title : String?
    var release_date : String?
    var original_language : String?
    var original_title : String?
    var genre_ids : [Int]?
    var backdrop_path : String?
    var adult : Bool?
    var overview : String?
    var poster_path : String?
    var popularity : Int?
    var media_type : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id, video, vote_count,video_average,title,release_date,original_language, original_title, genre_ids,backdrop_path, adult, overview, poster_path,popularity,media_type
    }
}
*/
public class ErrorResponse: Mappable {
    var status_code:Int!
    var status_message:String!
    
    
    required public init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    public func mapping(map: Map) {
        
        status_code <- map["status_code"]
        status_message <- map["status_message"]
    }
    
    static func convertToErrorResponse(_ errorCode: Int,error message:String) -> ErrorResponse{
        let errorResponse  = ErrorResponse()
        errorResponse.status_code = errorCode
        errorResponse.status_message = message
        return errorResponse
    }
}


