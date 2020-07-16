//
//  File.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 14..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import Foundation

struct Movie {
    var id = UUID()
    var name : String
    var imageName : String
    var likeCountPercent : Float
    var description : String
    
    init (name:String,imageName : String, likeCountPercent : Float, description : String ){
        self.name = name
        self.imageName = imageName
        self.likeCountPercent = likeCountPercent
        self.description = description
    }
    
    func getLikers() -> Float {
        return  round(likeCountPercent * 5)
    }
    
    func getDislikers() -> Float{
        return round((1-likeCountPercent) * 5)
    }
    
    static func divideMoviesByThree() -> Dictionary<Int,[Movie]> {
        var categorizedMovies = Dictionary<Int,[Movie]>()
        var i = 0
        var j = 0
        var ymovies = [Movie]()
        for movie in movies {
            ymovies.append(movie)
            j += 1
            if j.quotientAndRemainder(dividingBy: 3).remainder == 0 {
                categorizedMovies[i] = ymovies
                i += 1
                ymovies = [Movie]()
            }
        }
        categorizedMovies[i] = ymovies
        
        return categorizedMovies
    }
    
}

let movies = [
    Movie(name:"Averngers", imageName: "avengers", likeCountPercent : 2/5,description:"(Avengers) Good movie"),
    Movie(name: "Red Sparrow", imageName: "redsparrow", likeCountPercent : 2/5, description: "(Red Sparrow) Medium Movie"),
    Movie(name: "Blade Runner 2049", imageName: "bladerunner2049", likeCountPercent: 1/5, description: "(Blade Runner 2049) Excellent Movie "),
    Movie(name:"Down the River", imageName: "downtheriver", likeCountPercent: 3/5, description: "(Down the river) Azerbaijani Movie"),
    Movie(name: "1917", imageName: "1917", likeCountPercent: 4/5, description: "(1917) Bafta-Award winner movie")
    
]
