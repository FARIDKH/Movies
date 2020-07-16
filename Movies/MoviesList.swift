//
//  MoviesList.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 12..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

class MovieViewModel : ObservableObject {
    
    @Published var currentMovie : Movie = movies[3]
    
    func changeMovie(movie: Movie){
        self.currentMovie = movie
    }
    
}


struct MoviesList: View {
    
    @EnvironmentObject var movieVM : MovieViewModel
    
    @State var currentMovie : Movie = movies[0]
    
    
    @State var currentCategory : String = categories[0]
    
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
                                    }
                        
                            
                        }
                        
                    }
                    MoviesByCategoriesView()
                    
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


