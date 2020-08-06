//
//  ContentView.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 07. 12..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI




struct ContentView: View {
    
    var backgroundColor : Gradient = mainGradientColor()
    
    @State var username: String = ""
    @State var password : String = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    VStack(alignment: .center){
                        Text("Movie")
                            .font(Font.custom("Poppins-Bold", size:60))
                            .foregroundColor(.white)
                        Text("place of entertainment")
                            .font(Font.custom("Nunito", size:26))
                            .foregroundColor(.white)
                            .opacity(0.7)
                    }
                    .padding(.top,100)
                    
                    VStack(alignment:.center){
                        Text("Sign in")
                            .font(Font.custom("Poppins-Bold", size:45))
                            .foregroundColor(.white)
                            .padding(.bottom,20)
                        
                        CustomTextField(textFieldLabel: "Username", textFieldPlaceHolder: "Write your username")
                        
                        CustomTextField(textFieldLabel: "Password", textFieldPlaceHolder: "Write your password")
                        .padding(.top,15)
                        
                        NavigationLink(destination: MoviesList(movieVM: movieViewModel), label: {
                            CustomButton()
                                .padding(.top,20)

                        })
                            
                        
                    }
                    .padding(.top,100)
                    Spacer()
                    HStack{
                        Text("forget password?")
                            .foregroundColor(mainBlue())
                        Spacer()
                        Text("sign up")
                            .foregroundColor(mainBlue())
                    }
                    .padding()
                    .padding(.bottom,20)
                    
                }
                .frame(minWidth:0,maxWidth: .infinity,minHeight:0,maxHeight: .infinity)
                .background(BackgroundView())
                .edgesIgnoringSafeArea(.all)
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}

struct CustomTextField: View {
    
    @State var username: String = ""
    @State var password : String = ""
    
    var textFieldLabel : String
    var textFieldPlaceHolder : String

    var body: some View {
        VStack(alignment: .leading) {
            Text(textFieldLabel)
                .font(Font.custom("Nunito", size:16))
                .foregroundColor(.white)
            ZStack(alignment: .leading) {
                Text(textFieldPlaceHolder)
                    .padding(.leading,15)
                    .foregroundColor(.white)
                TextField("", text: $username)
                    .frame(width: 300, height: 45, alignment: .center)
                    .padding(.leading,15)
                    .cornerRadius(50)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white,lineWidth: 2))
            }
        }
    }
}
