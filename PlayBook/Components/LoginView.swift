//
//  LoginView.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/16.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Image("loginImg")
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 150)
            Text("Login")
                .foregroundColor(Color.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 24))
            Text("Welcome Back")
                .foregroundColor(Color.black)
                .font(.system(size: 14))
                .padding(.top, 5)
            ZStack(alignment: .leading){
                Color("offwhite")
                HStack{
                    Image(systemName: "envelope")
                        .padding(.leading, 10)
                    Text("email")
                        .brightness(0.5)
                }
            }
            .frame(width: 300, height: 50, alignment: .leading)
            .padding(.top, 20)
            ZStack(alignment: .leading){
                Color("offwhite")
                HStack{
                    Image(systemName: "lock")
                        .padding(.leading, 10)
                    Text("password")
                        .brightness(0.5)
                }
            }
            .frame(width: 300, height: 50, alignment: .leading)
            .padding(.top, 10)
            Button("Login"){
                
            }
            .padding(EdgeInsets(top: 15, leading: 130, bottom: 15, trailing: 130))
            .background(Color("red"))
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 8)
            )
            .padding(.top, 20)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
