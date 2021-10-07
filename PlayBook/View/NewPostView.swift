//
//  NewPostView.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/07.
//

import SwiftUI

struct NewPostView: View {
    
    let lightPurple = UIColor(red: 107/255, green: 70/255, blue: 246/255, alpha: 1.0)
    
    init() {
      let coloredAppearance = UINavigationBarAppearance()
      coloredAppearance.configureWithOpaqueBackground()
      coloredAppearance.backgroundColor = lightPurple
      coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
      coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
      
      UINavigationBar.appearance().standardAppearance = coloredAppearance
      UINavigationBar.appearance().compactAppearance = coloredAppearance
      UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
      
      UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
            ZStack {
                Color("offwhite")
                NavigationView {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0 ) {
                            ZStack {
                                Color("white")
                                    .shadow(radius: 5)
                                VStack(alignment: .leading, spacing: 0){
                                    Image("placeholder")
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 350, height: 280, alignment: .trailing)
                                    Text("Write a caption...")
                                        .font(.system(size: 10))
                                        .opacity(40)
                                        .padding(.leading, 30)
                                        .padding(.top, 10)
                                    Spacer()
                                    
                                }
                            }
                            .frame(width: .infinity, height: 380)
                            ZStack {
                                Color("white")
                                    .shadow(radius: 5)
                                HStack {
                                    Image(systemName: "tag.fill")
                                        .foregroundColor(Color("lightPurple"))
                                    Text("Tag People")
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                                .padding(.leading, 35)
                            }
                            .frame(width: .infinity, height: 45)
                            .padding(.top, 10)
                            ZStack {
                                Color("white")
                                    .shadow(radius: 5)
                                HStack {
                                    Image(systemName: "gamecontroller.fill")
                                        .foregroundColor(Color("lightPurple"))
                                    Text("Add Game")
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                                .padding(.leading, 35)
                            }
                            .frame(width: .infinity, height: 45)
                            .padding(.top, 10)
                            
                        }
                        .frame(width: .infinity)
                        
                    }
                    .navigationBarTitle("New Post", displayMode: .inline)
                    .navigationBarHidden(false)
                }
            }
        
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
