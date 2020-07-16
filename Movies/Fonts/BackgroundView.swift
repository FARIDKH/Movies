//
//  BackgroundView.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 12..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack{
            Image("spiderman").resizable().aspectRatio(contentMode: .fill)
                .offset(x: -40, y: 0)
            
            LinearGradient(gradient: mainGradientColor(), startPoint: .top, endPoint: .bottom).opacity(0.5)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
