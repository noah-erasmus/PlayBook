//
//  SignUpView.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/16.
//

import SwiftUI

struct SignUpView: View {
    
    @State var isLoading: Bool = true
    
    @State var errorMessage = ""
    @State var showingAlert = false
    
    
    var body: some View {
        ZStack{
            Color("red")
            VStack {
                Image("signupImg")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 150)
                Text("Sign Up")
                    .foregroundColor(Color.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 24))
                Text("Get Your Profile Ready")
                    .foregroundColor(Color.white)
                    .font(.system(size: 14))
                    .padding(.top, 5)
                ZStack(alignment: .leading){
                    Color("offwhite")
                    HStack{
                        Image(systemName: "person")
                            .padding(.leading, 10)
                        Text("username")
                            .brightness(0.5)
                    }
                }
                .frame(width: 300, height: 50, alignment: .leading)
                .padding(.top, 20)
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
                .padding(.top, 10)
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
                .background(Color("offwhite"))
                .foregroundColor(Color("red"))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("red"), lineWidth: 8)
                )
                .padding(.top, 20)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
