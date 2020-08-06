//
//  ProfileView.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 08. 06..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    let sections : Dictionary<Int,String> = [
        0 : "Watched",
        1 : "Favourite",
        2 : "Watchlist"
    ]
    
    let tags : Dictionary<Int,String> = [
        0 : "Action",
        1 : "Crime",
        2 : "Drama",
        3 : "Mystery",
        4 : "Sci-fi",
        5 : "Indie" ,
        6 : "Documentary",
        7 : "Mockumentary"
    ]
    
    @State var selectedSection = 0
    @State var selectedTag = 0
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            
            ProfileNavigationBar()
                .padding(.horizontal,20)
                
            
            BasicProfileInfo()
                .padding(.horizontal,20)
                .padding(.top,20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:40) {
                    ForEach(sections.keys.sorted(), id: \.self) { key in
                        VStack {
                            Text("\(self.sections[key]!)")
                                .font(Font.custom("Poppins-Bold", size:40))
                                .foregroundColor(self.selectedSection == key ? .white : .gray)
                            CustomDivider(color: .white, width: 200, height: self.selectedSection == key ? 2 : 0)
                                .padding(.top,-30)
                        }
                        .onTapGesture {
                            self.selectedSection = key
                        }
                    }
                }
                .padding(.top,50)
                .padding(.horizontal,20)
            }
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                    HStack {
                        
                        ForEach(tags.keys.sorted(), id : \.self) { key in
                            HStack {
                                Text("\(self.tags[key]!)")
                                    .font(Font.custom("Poppins", size:14))
                                    .foregroundColor(self.selectedTag != key ? createColorFromRBG(red: 17, blue: 98, green: 166) : .white)
                                CustomDivider(color: createColorFromRBG(red: 17, blue: 98, green: 166), width: 1, height: 20)
                            }
                            .onTapGesture {
                                self.selectedTag = key
                            }
                        }
                    }
                    .padding(.leading,20)
                    .padding(.bottom,20)
            }
            
            MoviesByCategoriesView(movieMV: movieViewModel)
            .padding(.horizontal,20)
            
            
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [createColorFromRBG(red: 50, blue: 30, green: 62),mainBlue()]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            print("test")
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct BasicProfileInfo: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("jasonnash")
                .resizable()
                .frame(width: 125, height: 125)
                .cornerRadius(25)
            
            VStack(alignment:.leading){
                Text("Jason Nash")
                    .font(Font.custom("Poppins-Bold", size:20))
                    .foregroundColor(.white)
                Text("Type what in your mind?...")
                    .font(Font.custom("Poppins", size:12))
                    .foregroundColor(mainPurpure())
                Spacer()
                HStack {
                    
                    VStack(alignment:.leading) {
                        Text("100")
                            .font(Font.custom("Poppins-Bold", size:18))
                            .foregroundColor(mainPurpure())
                        Text("Movie Watch")
                            .font(Font.custom("Poppins", size:10))
                            .foregroundColor(createColorFromRBG(red: 17, blue: 98, green: 166))
                    }
                    .padding(.trailing,15)
                    
                    VStack(alignment:.leading) {
                        Text("1234")
                            .font(Font.custom("Poppins-Bold", size:18))
                            .foregroundColor(.white)
                        Text("Followers")
                            .font(Font.custom("Poppins", size:10))
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment:.leading) {
                        Text("100")
                            .font(Font.custom("Poppins-Bold", size:18))
                            .foregroundColor(.white)
                        Text("Following")
                            .font(Font.custom("Poppins", size:10))
                            .foregroundColor(.white)
                    }
                    .padding(.leading,15)
                }
                
            }
            .padding(.leading,15)
            Spacer()
        }
        .frame(height:125)
    }
}

struct ProfileNavigationBar: View {
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "chevron.left")
                .foregroundColor(.gray)
                .imageScale(.large)
            
            Spacer()
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(.gray)
                .imageScale(.large)
            
            Image(systemName: "pencil.circle")
                .foregroundColor(.gray)
                .imageScale(.large)
            
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.gray)
                .imageScale(.large)
        }
        .padding(.top,100)
    }
}
