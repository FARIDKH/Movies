//
//  MoviesList.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 12..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

class MovieViewModel : ObservableObject {
    
    @Published var currentMovie : Movie = movies[0]
    @Published var currentMovieList : [Movie] = movies
    
    
    func changeMovie(movie: Movie){
        self.currentMovie = movie
    }
    
    func changeMovieList(by category: String){
        switch category {
        case categories[0]:
            self.currentMovieList = movies.sorted(by: { $0.popularity > $1.popularity })
            break
        case categories[1]:
            self.currentMovieList = movies.sorted(by: { $0.releaseDate > $1.releaseDate })
        case categories[2]:
            self.currentMovieList = movies.filter({ (movie) -> Bool in
                
                
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
        
        
    }
    
    func getCategorizedDividedMovieList() -> Dictionary<Int,[Movie]> {
        
        return divideMoviesByThree(movies: self.currentMovieList)
    }
    
}


struct MoviesList: View {
    
    @EnvironmentObject var movieVM : MovieViewModel
    
    @State var currentMovie : Movie = movies[0]
    @State var currentCategory : String = categories[0]
    @State var categorizedMovies : Dictionary<Int,[Movie]> = {
        let dict = divideMoviesByThree(movies: movies)
        return dict
    }()
    
    
    init() {
       UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack {
                VStack {
                    HStack {
                        Button(action: { print("clicked") }, label: { Image("text.justifyleft") })
                            .foregroundColor(.white)
                        Spacer()
                        Text("Movie")
                            .font(Font.custom("Poppins-Bold",size: 30))
                            .foregroundColor(.white)
                            .offset(x: 25, y: 5)
                        Spacer()
                        Button(action: { print("clicked") }, label: { Image("heart") })
                            .foregroundColor(.white)
                        Button(action: { print("clicked") }, label: { Image("person") })
                            .foregroundColor(.white)
                        
                    }
                    .frame(width:350,height : 50)
                    .padding(.top,70)
                    
                    

                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                                ForEach(movies,id: \.id){ item in
                                    MovieCard(image: item.imageName)
                                        .onTapGesture {
                                            self.movieVM.changeMovie(movie: item)
                                            self.currentMovie = item
                                        }
                                }
                                .padding(30)
                                .padding(.vertical,20)
                        }
                    }
                    .padding(.top,-35)
                    
                }
                .background(
                    Image(movieVM.currentMovie.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .blur(radius: 15)

                )
                .frame(height: 400, alignment: .center)
                .clipped()
                .cornerRadius(50, corners: [.bottomLeft,.bottomRight])
                
                VStack {
                    HStack {
                        
                        RatingView(movie: $currentMovie)
                        
                    }
                    Text(currentMovie.description)
                    .font(Font.custom("Poppins",size:14))
                    .foregroundColor(.white)
                    .padding()
                    
                    HStack{
                        ForEach(0 ..< categories.count) { i in
                            Text(categories[i])
                                .underline( (categories[i] == self.currentCategory) ? true : false )
                                .font(Font.custom("Poppins-Bold",size:16))
                                    .foregroundColor(darkPurpure())
                                .frame(width:100,height:50,alignment:.center)
                                .padding(-5)
                                .onTapGesture {
                                    self.currentCategory = categories[i]
                                    self.movieVM.changeMovieList(by: categories[i])
                                    self.categorizedMovies = self.movieVM.getCategorizedDividedMovieList()
                                }
                        }
                    }
                    
                    MoviesByCategoriesView(categorizedMovies: $categorizedMovies)
                        .frame(minHeight:300,maxHeight:.infinity)
                    
                }
                .padding(.all,30)
                
                Spacer()
            }
            .background(mainBlue())
        }
        .edgesIgnoringSafeArea(.all)
        .background(mainBlue())
    
    
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList().environmentObject(MovieViewModel())
    }
}


