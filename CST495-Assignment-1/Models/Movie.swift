//
//  Movie.swift
//  CST495-Assignment-1
//
//  Created by Samuel on 2/21/18.
//  Copyright © 2018 Samuel. All rights reserved.
//

class Movie{
    var title: String
    var posterUrl: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        
        // Set the rest of the properties
        posterUrl = URL()
    }
}
