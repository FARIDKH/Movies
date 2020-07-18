//
//  MovieViewModel.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 18..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

class MovieViewModel : ObservableObject {
    
    @Published var currentMovie : Movie = movies[0]
    @Published var currentMovieList : Dictionary<Int,[Movie]>
    
    init(){
        self.currentMovieList = divideMoviesByThree(movies: movies)
    }
    
    
    func changeMovie(movie: Movie){
        self.currentMovie = movie
    }
    
    func changeMovieList(by category: String){
        var categorizedMovies = movies
        switch category {
        case categories[0]:
            categorizedMovies = movies.sorted(by: { $0.popularity > $1.popularity })
            break
        case categories[1]:
            categorizedMovies = movies.sorted(by: { $0.releaseDate > $1.releaseDate })
        case categories[2]:
            categorizedMovies = movies.filter({ (movie) -> Bool in
                
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                dateFormatter.dateStyle = .short
                dateFormatter.locale = Locale(identifier: "en_US")
                let formattedDate = dateFormatter.date(from: movie.releaseDate)
                let now = Date()
                var result = true
                if let releaseDate = formattedDate {
                    let component = Calendar.current.dateComponents([.month,.day,.year], from: releaseDate, to: now)
                    if component.day! < 0 || component.year! < 0 || component.month! < 0 {
                        result = true
                    } else {
                        result = false
                    }
                }
                
                return result
                
            })
        default:
            break
        }
        
        self.currentMovieList = divideMoviesByThree(movies: categorizedMovies)
        
        
    }
    
    
}
