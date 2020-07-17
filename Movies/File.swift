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
    var popularity : Int
    var releaseDate : String
    
    
    init (name: String,imageName: String, likeCountPercent: Float, description: String, popularity: Int, releaseDate: String ){
        self.name = name
        self.imageName = imageName
        self.likeCountPercent = likeCountPercent
        self.description = description
        self.popularity = popularity
        self.releaseDate = releaseDate
    }
    
    func getLikers() -> Float {
        return  round(likeCountPercent * 5)
    }
    
    func getDislikers() -> Float{
        return round((1-likeCountPercent) * 5)
    }
    
    
    
}

let movies = [
    
    Movie(name:"Averngers", imageName: "avengers", likeCountPercent : 2/5,description:"(Avengers) Good movie", popularity: 5,releaseDate:"02/02/2000"),
    Movie(name: "Red Sparrow", imageName: "redsparrow", likeCountPercent : 2/5, description: "(Red Sparrow) Medium Movie",popularity: 10,releaseDate:"07/20/2020"),
    Movie(name: "Blade Runner 2049", imageName: "bladerunner2049", likeCountPercent: 1/5, description: "(Blade Runner 2049) Excellent Movie ", popularity: 25,releaseDate:"03/12/2008"),
    Movie(name:"Down the River", imageName: "downtheriver", likeCountPercent: 3/5, description: "(Down the river) Azerbaijani Movie", popularity: 12,releaseDate: "11/27/2007"),
    Movie(name: "1917", imageName: "1917", likeCountPercent: 4/5, description: "(1917) Bafta-Award winner movie",popularity: 45,releaseDate:"11/02/2021")
    
]
