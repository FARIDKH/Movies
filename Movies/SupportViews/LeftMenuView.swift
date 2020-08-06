//
//  LeftMenuView.swift
//  Movies
//
//  Created by Farid Ganbarli on 2020. 08. 03..
//  Copyright © 2020. faridganbarli. All rights reserved.
//

import SwiftUI



struct CustomDivider : View {
    let color : Color
    let width : CGFloat
    let height : CGFloat
    var body : some View {
        Rectangle()
            .fill(color)
            .frame(width: width, height: height, alignment: .center)
    }
}

fileprivate struct HiddenModifier : ViewModifier {
    
    private let isHidden : Bool
    private let remove : Bool
    
    init(isHidden: Bool, remove: Bool = false){
        self.remove = remove
        self.isHidden = isHidden
    }
    
    func body(content: Content) -> some View {
        Group {
            if isHidden {
                if remove {
                    EmptyView()
                } else {
                    content.hidden()
                }
            } else {
                content
            }
        }
    }
    
}

extension View {
    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        modifier(HiddenModifier(isHidden: hidden, remove: remove))
    }
}

struct LeftMenuView: View {
    
    @State var profileIsHidden = false
    @State var noticesIsOn = true
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment:.leading) {
                Text("Movie")
                    .font(Font.custom("Poppins-Bold", size:40))
                    .foregroundColor(.white)
                    .padding(.top,100)
                    .padding(.leading,40)
                
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
                                Text("1234")
                                    .font(Font.custom("Poppins-Bold", size:18))
                                    .foregroundColor(.white)
                                Text("Followers")
                                    .font(Font.custom("Poppins", size:12))
                                    .foregroundColor(.white)
                            }
                            VStack(alignment:.leading) {
                                Text("100")
                                    .font(Font.custom("Poppins-Bold", size:18))
                                    .foregroundColor(.white)
                                Text("Following")
                                    .font(Font.custom("Poppins", size:12))
                                    .foregroundColor(.white)
                            }
                            .padding(.leading,15)
                        }
                        
                    }
                    .padding(.leading,15)
                    Spacer()
                }
                .frame(height:125)
                .padding(.leading,40)
            }
            
            Divider()
            
            
                
            VStack {
                LeftSlideMenuItem(menuItemTitle: "your Favourite")
                
                LeftSlideMenuItem(menuItemTitle: "Share your profile")
                
                LeftSlideMenuItem(menuItemTitle: "Rate us", heightOf: 0)
            }
            .padding(.top,20)
            .padding(.bottom,10)
            .background(createColorFromRBG(red: 19, blue: 18, green: 34))
            .shadow(color: .black, radius: 3, x: 0, y: 5)
            
            VStack(spacing:20) {
                LeftSlideMenuItem(menuItemTitle: "Hide your profile",heightOf: 0,isHidden: false,isOn: $profileIsHidden)
                    .onTapGesture {
                        self.profileIsHidden = !self.profileIsHidden
                    }
                LeftSlideMenuItem(menuItemTitle: "Notices",heightOf: 0,isHidden: false,isOn: $noticesIsOn)
                    .onTapGesture {
                        self.noticesIsOn = !self.noticesIsOn
                    }
            }
            .shadow(color: .black, radius: 3, x: -2, y: 5)
            .padding(.top,10)
            .padding(.bottom,20)
            .background(createColorFromRBG(red: 19, blue: 18, green: 34))
            .shadow(color: .black, radius: 3, x: -2, y: 5)
            VStack {
                LeftSlideMenuItem(menuItemTitle: "Setting")
                
                LeftSlideMenuItem(menuItemTitle: "About App", heightOf: 0)
            }
            .padding(.top,10)
            .padding(.bottom,20)
            .background(createColorFromRBG(red: 19, blue: 18, green: 34))
            .shadow(color: .black, radius: 3, x: -2, y: 5)
            
            Spacer()
        }
        .background(mainBlue().opacity(0.9))
        .edgesIgnoringSafeArea(.all)
        .frame(width:350)
        .offset(x:-45)
    }
}

struct LeftMenuView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        LeftMenuView(profileIsHidden: false,noticesIsOn: false)
    }
}

struct LeftSlideMenuItem: View {
    
    var menuItemTitle : String
    var height : CGFloat = 2
    var toggleIsHidden = true
    
    
    @Binding var toggleIsOn : Bool
    
    
    
    
    init(
        menuItemTitle title: String,
        heightOf divider : CGFloat = 2,
        isHidden : Bool = true,
        isOn : Binding<Bool> = .constant(false))
    {
            self.menuItemTitle = title
            self.height = divider
            self._toggleIsOn = isOn
            self.toggleIsHidden = isHidden
    }
    
    
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(menuItemTitle)
                    .font(Font.custom("Poppins", size:16))
                    .foregroundColor(.white)
                    .lineLimit(1)
                Spacer()
                Toggle(isOn: $toggleIsOn) {
                    Text("")
                }
                .isHidden(toggleIsHidden)
                .padding(.trailing,10)
                
            }
            CustomDivider(color: .gray, width: 310, height: height)
            
            
        }
        .padding(.leading,40)
    }
}
