//
//  MovieCard.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 14..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

struct MovieCard: View {
    
    var image : String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 220)
                .clipped()
                .cornerRadius(50)
                .shadow(color: .black, radius: 15, x: 0, y: 0)
        }

    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(image: "avengers")
    }
}
