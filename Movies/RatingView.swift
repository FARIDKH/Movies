//
//  RatingView.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 14..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var movie : Movie
        
    var likes : [Image] = [Image]()
    
    var offImage = Image(systemName:"star")
    var onImage = Image(systemName:"star.fill")
    
    var maximumRating = 5
    
    var body: some View {
        HStack{
            ForEach(1 ..< maximumRating + 1 ){ number in
                self.image(for: number)
                    .scaleEffect(1.2)
                    .padding(.all,5)
                    .foregroundColor(mainPurpure())
                
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > Int(movie.getLikers()) {
            return offImage
        } else {
            return onImage
        }
    }
}
//
//
//struct RatingView_Previews: PreviewProvider {
//
//    @State var movie  = movies[3]
//
//    static var previews: some View {
//        RatingView(movie: <#T##Binding<Movie>#>)
//    }
//}

