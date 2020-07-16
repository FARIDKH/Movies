//
//  CustomButton.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 12..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    
    
    
    var body: some View {
        VStack{
            Button("Sign in",action:{
                print("button clicked")
            })
        }
        .font(.system(size: 20, weight: .bold))
        .frame(width: 300, height: 60, alignment: .center)
        .foregroundColor(.white)
        .background(LinearGradient(gradient: secondaryGradientColor(), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(30)
        .shadow(color: .black, radius: 35, x: 0, y: 0)
        
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
