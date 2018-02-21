//
//  Movie.swift
//  CST495-Assignment-1
//
//  Created by Samuel on 2/21/18.
//  Copyright © 2018 Samuel. All rights reserved.
//

import Foundation
class Movie{
    var id: Int
    var title: String
    var overview: String
    var posterUrl: URL?
    var backdropUrl: URL?
    var baseURLString: String
    var releaseDate: String
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as! Int
        baseURLString = "https://image.tmdb.org/t/p/w500"
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No date"
        posterUrl = URL(string: baseURLString + (dictionary["poster_path"] as? String)!)
        backdropUrl = URL(string: baseURLString + (dictionary["backdrop_path"] as? String)!)
        // Set the rest of the properties
        
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
    
}
