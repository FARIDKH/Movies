//
//  MovieRow.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 15..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
    
    var imageName : String
    var movieName : String
    
    var body: some View {
        VStack {
            Image(imageName)
            .resizable()
                .frame(width: 120, height: 170, alignment: .center)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(20)
            Text(movieName)
                .font(Font.custom("Poppins",size:14))
                .foregroundColor(.gray)
        }
        .frame(width: 120, height:200, alignment: .center)
    
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(imageName: movies[0].imageName, movieName: movies[0].name)
    }
}
