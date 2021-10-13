//
//  ProfileView.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/07.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            NavigationView{
                ScrollView {
                    VStack {
                        ZStack {
                            VStack(spacing:0) {
                                Image("placeholder")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: .infinity, height: 200, alignment: .trailing)
                                ZStack {
                                    Color("lightPurple")
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Text("1302")
                                                .font(.system(size: 14))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("white"))
                                            Text("Followers")
                                                .font(.system(size: 12))
                                                .foregroundColor(Color("white"))
                                        }
                                        VStack {
                                            Text("1834")
                                                .font(.system(size: 14))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("white"))
                                            Text("Following")
                                                .font(.system(size: 12))
                                                .foregroundColor(Color("white"))
                                        }
                                        VStack {
                                            Text("146")
                                                .font(.system(size: 14))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("white"))
                                            Text("Posts")
                                                .font(.system(size: 12))
                                                .foregroundColor(Color("white"))
                                        }
                                    }
                                    .padding(.trailing, 30)
                                }
                                .frame(width: .infinity, height: 80)
                                ZStack {
                                    Color("white")
                                        .shadow(radius: 5, x: 0, y: 5)
                                    HStack {
                                        Text("Joined")
                                            .fontWeight(.bold)
                                            .font(.system(size: 14))
                                            .padding(.trailing, 45)
                                            .padding(.leading, 30)
                                        Text("1 Year Ago")
                                            .font(.system(size: 14))
                                        Spacer()
                                    }
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                }

                            }
                            Image("placeholderCircle")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: 100, height: 100, alignment: .trailing)
                                .overlay(
                                    Circle()
                                        .stroke(Color("white"), lineWidth: 4)
                                )
                                .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 180))
                        }
                        ZStack {
                            Color("white")
                                .shadow(radius: 5)
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Bio")
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                                    .padding(.leading, 20)
                                    .padding(.bottom, 5)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer imperdiet elit ligula, et accumsan dui malesuada sed.")
                                    .font(.system(size: 14))
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            
                        }
                        
                        ZStack {
                            Color("white")
                                .shadow(radius: 5)
                            VStack (alignment: .leading, spacing: 0) {
                                Text("Friends")
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                                    .padding(.leading, 20)
                                    .padding(.bottom, 5)
                                ScrollView(.horizontal) {
                                    HStack {
                                        Image("placeholderCircle")
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 50, height: 50, alignment: .trailing)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color("lightPurple"), lineWidth: 3)
                                            )
                                            .padding(.leading, 5)
                                            .padding(.trailing, 5)
                                        Image("placeholderCircle")
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 50, height: 50, alignment: .trailing)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color("lightPurple"), lineWidth: 3)
                                            )
                                            .padding(.leading, 5)
                                            .padding(.trailing, 5)
                                        Image("placeholderCircle")
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 50, height: 50, alignment: .trailing)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color("lightPurple"), lineWidth: 3)
                                            )
                                            .padding(.leading, 5)
                                            .padding(.trailing, 5)
                                        Image("placeholderCircle")
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 50, height: 50, alignment: .trailing)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color("lightPurple"), lineWidth: 3)
                                            )
                                            .padding(.leading, 5)
                                            .padding(.trailing, 5)
                                        Image("placeholderCircle")
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 50, height: 50, alignment: .trailing)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color("lightPurple"), lineWidth: 3)
                                            )
                                            .padding(.leading, 5)
                                            .padding(.trailing, 5)
                                    }
                                    .padding(.top,10)
                                    .padding(.leading,10)
                                }
                            }
                            .padding(.top, 10)
                        }
                        ZStack {
                            Color("white")
                                .shadow(radius: 5)
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Bio")
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                                    .padding(.leading, 20)
                                    .padding(.bottom, 5)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer imperdiet elit ligula, et accumsan dui malesuada sed.")
                                    .font(.system(size: 14))
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            
                        }
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
//                VStack {
//                    ZStack {
//                        Color("lightPurple")
//                        VStack {
//                            Image("placeholderCircle")
//                                .renderingMode(.original)
//                                .resizable()
//                                .aspectRatio( contentMode: .fill)
//                                .frame(width: 80, height: 80, alignment: .trailing)
//                                .overlay(
//                                    Circle()
//                                        .stroke(Color("white"), lineWidth: 4)
//                                )
//                                .padding(.bottom, 10)
//                            Text("TheLegend27")
//                                .fontWeight(.bold)
//                                .foregroundColor(Color("white"))
//                                .font(.system(size: 16))
//                            Text("Elite Noob Slayer")
//                                .foregroundColor(Color("white"))
//                                .font(.system(size: 12))
//                            HStack (spacing:25) {
//                                VStack {
//                                    Text("1302")
//                                        .font(.system(size: 14))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(Color("white"))
//                                    Text("Followers")
//                                        .font(.system(size: 12))
//                                        .foregroundColor(Color("white"))
//                                }
//                                VStack {
//                                    Text("146")
//                                        .font(.system(size: 14))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(Color("white"))
//                                    Text("Posts")
//                                        .font(.system(size: 12))
//                                        .foregroundColor(Color("white"))
//                                }
//                                VStack {
//                                    Text("1834")
//                                        .font(.system(size: 14))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(Color("white"))
//                                    Text("Following")
//                                        .font(.system(size: 12))
//                                        .foregroundColor(Color("white"))
//                                }
//                            }
//                            .padding(.top, 30)
//                        }
//                    }
//                    .frame(width: 270, height: 300)
//                    .cornerRadius(20)
//                }
//                .navigationBarTitle("", displayMode: .inline)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
