//
//  MoviesByCategoriesView.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 15..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI



struct MoviesByCategoriesView: View {
    
    
//    @Binding var categorizedMovies : Dictionary<Int,[Movie]>
    
    @ObservedObject var movieMV : MovieViewModel
    
    var body: some View {
        VStack(alignment:.leading) {
            ForEach(movieMV.currentMovieList.keys.sorted(),id: \.self) { key  in
                HStack {
                    
                    ForEach(self.movieMV.currentMovieList[key]!.indices,id:\.self) { index in
                        self.makeMovieRowBy(movie: self.movieMV.currentMovieList[key]![index])
                    }
                }
                .animation(.spring())
            }
            
            
        }
    }
    
    func makeMovieRowBy(movie: Movie) -> MovieRow? {
        
        var movieRow : MovieRow?
        
        movieRow =  MovieRow(imageName: movie.imageName, movieName: movie.name)
//        print("----")
//        print(categorizedMovies.keys)
//        for movie in categorizedMovies[0]! {
//            print(movie.name)
//        }
//        print("----")
        return movieRow ?? nil
    }
    
    
    
}

//struct MoviesByCategoriesView_Previews: PreviewProvider {
//
//    @State static var ymovies = movies
//
//    static var previews: some View {
//        MoviesByCategoriesView(currentCategoryList: ymovies)
//    }
//}
