//
//  MoviesByCategoriesView.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 15..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI



struct MoviesByCategoriesView: View {
    
    
    
    let delimeter = abs(movies.count / 3) + movies.count.quotientAndRemainder(dividingBy: 3).remainder
    
    
    @State var selectedCategoryMovies : [Movie] = [Movie]()
    
    var categorizedMovies = Movie.divideMoviesByThree()
    
    var body: some View {
        VStack(alignment:.leading) {
            ForEach((categorizedMovies.keys.sorted()),id: \.self) { key  in
                HStack {
                    ForEach(0 ..< (self.categorizedMovies[key]?.count ?? 0)) { index in
                        self.makeMovieRowBy(movie: self.categorizedMovies[key]![index])
                    }
                }
                
            }
        }
    }
    
    func makeMovieRowBy(movie: Movie) -> MovieRow? {
        
        
        
        var movieRow : MovieRow?
        
        movieRow =  MovieRow(imageName: movie.imageName, movieName: movie.name)
        
        return movieRow ?? nil
        
    }
    
    
}

struct MoviesByCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesByCategoriesView()
    }
}
