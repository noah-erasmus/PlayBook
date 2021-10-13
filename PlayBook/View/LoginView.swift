//
//  LoginView.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/07.
//

import SwiftUI

struct LoginView: View {
    @State private var emailVal: String = ""
    @State private var passwordVal: String = ""
    
    @State var errorMessage = ""
    @State var showingAlert = false
    @State var errorTitle = ""
    
    @EnvironmentObject var userAuth: UserAuth
    
    func errorCheck() -> String? {
        if emailVal.trimmingCharacters(in: .whitespaces).isEmpty ||
            passwordVal.trimmingCharacters(in: .whitespaces).isEmpty {
            print("click")
            return "Please fill in all the above information."
        }
        return nil
    }
    
    func clear(){
        self.emailVal = ""
        self.passwordVal = ""
    }
    
    func signIn(){
        if let error = errorCheck(){
            self.errorMessage = error
            self.showingAlert = true
            return
        }
        
        AuthService.signIn(email: emailVal, password: passwordVal, onSuccess: {(user) in
            self.clear()
            print("Firebase Auth ID: \(user)")
//            userId = user
            return
        }, onError: {(errorMessage) in
            print("Error \(errorMessage)")
            self.errorMessage = errorMessage
            self.showingAlert = true
            return
        })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            ZStack{
                Color("lightPurple")
            }
            .frame(width:.infinity, height: 200)
            ZStack {
                Color("offwhite")
                VStack{
                    HStack{
                        Text("Login")
                            .fontWeight(.bold)
                            .underline(true, color: Color("lightPurple"))
                        Text("Register")
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 30)
                    ZStack{
                        Color("white")
                            .cornerRadius(5)
                            .shadow(radius: 2)
                        VStack(alignment: .leading, spacing: 0){
                            Text("Email")
                                .foregroundColor(Color("lightPurple"))
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                            TextField("legend27@gmail.com", text: $emailVal)
                                .background(Color("white"))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                        }
                    }
                    .frame(width: 280, height: 50, alignment: .leading)
                    ZStack{
                        Color("white")
                            .cornerRadius(5)
                            .shadow(radius: 2)
                        VStack(alignment: .leading, spacing: 0){
                            Text("Password")
                                .foregroundColor(Color("lightPurple"))
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                            TextField("***********", text: $passwordVal)
                                .background(Color("white"))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                        }
                    }
                    .frame(width: 280, height: 50, alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    Button(action: {
                        print("CLicked login")
                        signIn()
                        userAuth.isLoggedIn = true
                    }, label: {
                        Text("LOGIN")
                            .padding(EdgeInsets(top: 11, leading: 60, bottom: 11, trailing: 60))
                            .background(Color("lightPurple"))
                            .foregroundColor(Color("white"))
                            .cornerRadius(10)
                    })
                    .padding(.top, 20)
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Sure Thing")))
                    })
                }
                
            }
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(UserAuth())
    }
}
