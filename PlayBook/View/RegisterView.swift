//
//  RegisterView.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/07.
//

//import SwiftUI
//
//struct RegisterView: View {
//    @State private var signUpUserVal: String = ""
//    @State private var signUpEmailVal: String = ""
//    @State private var signUpPasswordVal: String = ""
//    @State private var signUpPasswordConfirmVal: String = ""
//
//
//    @State var errorMessage: String = ""
//    @State var showingAlert = false
//    @State var alertTitle = "Oh no!"
//
//    @EnvironmentObject var userAuth: UserAuth
//
//    func errorCheck() -> String? {
//        if signUpUserVal.trimmingCharacters(in: .whitespaces).isEmpty ||
//            signUpEmailVal.trimmingCharacters(in: .whitespaces).isEmpty ||
//            signUpPasswordVal.trimmingCharacters(in: .whitespaces).isEmpty
//        {
//            return "Please fill in all the above information."
//        }
//        return nil
//    }
//
//    func clear() {
//        self.signUpUserVal = ""
//        self.signUpEmailVal = ""
//        self.signUpPasswordVal = ""
//    }
//
//    func signUp(){
//        if let error = errorCheck(){
//            self.errorMessage = error
//            self.showingAlert = true
//            return
//        }
//
//        AuthService.signUp(username: signUpUserVal, email: signUpEmailVal, password: signUpPasswordVal, onSuccess: {(uid) in
//            print(uid)
//            return
//        }, onError: {(error) in
//            self.errorMessage = error
//            self.showingAlert = true
//            return
//        })
//    }
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0){
//            ZStack{
//                Color("lightPurple")
//            }
//            .frame(width:.infinity, height: 150)
//            ZStack {
//                Color("offwhite")
//                VStack{
//                    HStack{
//                        Text("Login")
//                        Text("Register")
//                            .fontWeight(.bold)
//                            .underline(true, color: Color("lightPurple"))
//                        Spacer()
//                    }
//                    .padding(.leading, 20)
//                    .padding(.bottom, 30)
//                    ZStack{
//                        Color("white")
//                            .cornerRadius(5)
//                            .shadow(radius: 2)
//                        VStack(alignment: .leading, spacing: 0){
//                            Text("Username")
//                                .foregroundColor(Color("lightPurple"))
//                                .font(.system(size: 10))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
//                            TextField("TheLegend27", text: $signUpUserVal)
//                                .background(Color("white"))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
//                        }
//                    }
//                    .frame(width: 280, height: 50, alignment: .leading)
//                    ZStack{
//                        Color("white")
//                            .cornerRadius(5)
//                            .shadow(radius: 2)
//                        VStack(alignment: .leading, spacing: 0){
//                            Text("Email")
//                                .foregroundColor(Color("lightPurple"))
//                                .font(.system(size: 10))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
//                            TextField("legend27@gmail.com", text: $signUpEmailVal)
//                                .background(Color("white"))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
//                        }
//                    }
//                    .frame(width: 280, height: 50, alignment: .leading)
//                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
//                    ZStack{
//                        Color("white")
//                            .cornerRadius(5)
//                            .shadow(radius: 2)
//                        VStack(alignment: .leading, spacing: 0){
//                            Text("Password")
//                                .foregroundColor(Color("lightPurple"))
//                                .font(.system(size: 10))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
//                            TextField("***********", text: $signUpPasswordVal)
//                                .background(Color("white"))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
//                        }
//                    }
//                    .frame(width: 280, height: 50, alignment: .leading)
//                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
//                    ZStack{
//                        Color("white")
//                            .cornerRadius(5)
//                            .shadow(radius: 2)
//                        VStack(alignment: .leading, spacing: 0){
//                            Text("Confirm Password")
//                                .foregroundColor(Color("lightPurple"))
//                                .font(.system(size: 10))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
//                            TextField("***********", text: $signUpPasswordConfirmVal)
//                                .background(Color("white"))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
//                        }
//                    }
//                    .frame(width: 280, height: 50, alignment: .leading)
//                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
//                    Button(action: {
//                        signUp()
//                    }, label: {
//                        Text("LOGIN")
//                            .padding(EdgeInsets(top: 11, leading: 60, bottom: 11, trailing: 60))
//                            .background(Color("lightPurple"))
//                            .foregroundColor(Color("white"))
//                            .cornerRadius(10)
//                    })
//                    .padding(.top, 20)
//                    .alert(isPresented: $showingAlert, content: {
//                        Alert(title: Text(alertTitle), message: Text(errorMessage), dismissButton: .default(Text("Sure thing")))
//                    })
//                }
//
//            }
//            Spacer()
//        }
//    }
//}
//
//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}




// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------

import SwiftUI
import Firebase
import FirebaseAuth

struct RegisterView: View {
    
    @State var username = ""
    @State var email = ""
    @State var pass = ""
    @State var passConf = ""
    @State var visible = false
    @State var visibleConf = false
    @State var error = ""
    @State var alert = false
    
    func clear(){
        self.email = ""
        self.pass = ""
        self.username = ""
        self.passConf = ""
    }
    
    func register(){
        if self.email != "" {
            if self.pass == self.passConf {
                AuthService.register(username: self.username, email: self.email, password: self.pass, onSuccess: {(userId) in
                    self.clear()
                    UserDefaults.standard.set(userId, forKey: "user")
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }, onError: {(error) in
                    self.error = "There was an error signing up!"
                    self.alert.toggle()
                })
            } else {
                self.error = "Password mismatch!"
                self.alert.toggle()
            }
        } else {
            self.error = "Please fill all the contents properly!"
            self.alert.toggle()
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            ZStack{
                Color("lightPurple")
            }
            .frame(width:.infinity, height: 150)
            ZStack {
                Color("offwhite")
                VStack{
                    HStack{
                        NavigationLink(destination: LoginView()){
                            Text("Login")
                        }
                        Text("Register")
                            .fontWeight(.bold)
                            .underline(true, color: Color("lightPurple"))
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 30)
                    ZStack{
                        Color("white")
                            .cornerRadius(5)
                            .shadow(radius: 2)
                        VStack(alignment: .leading, spacing: 0){
                            Text("Username")
                                .foregroundColor(Color("lightPurple"))
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                                .autocapitalization(.none)
                            TextField("TheLegend27", text: self.$username)
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
                            Text("Email")
                                .foregroundColor(Color("lightPurple"))
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                            TextField("legend27@gmail.com", text: self.$email)
                                .background(Color("white"))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                                .autocapitalization(.none)
                        }
                    }
                    .frame(width: 280, height: 50, alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    ZStack{
                        Color("white")
                            .cornerRadius(5)
                            .shadow(radius: 2)
                        VStack(alignment: .leading, spacing: 0){
                            Text("Password")
                                .foregroundColor(Color("lightPurple"))
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                            HStack{
                                if self.visible {
                                    TextField("***********", text: self.$pass)
                                        .background(Color("white"))
                                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                                        .autocapitalization(.none)
                                    
                                } else {
                                    SecureField("***********", text: self.$pass)
                                        .background(Color("white"))
                                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                                        .autocapitalization(.none)
                                }
                                
                                Button(action: {
                                    self.visible.toggle()
                                }){
                                    Image(systemName:  self.visible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(Color("lightPurple"))
                                }
                                
                            }
                        }
                    }
                    .frame(width: 280, height: 50, alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    ZStack{
                        Color("white")
                            .cornerRadius(5)
                            .shadow(radius: 2)
                        VStack(alignment: .leading, spacing: 0){
                            Text("Confirm Password")
                                .foregroundColor(Color("lightPurple"))
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                            HStack {
                                if self.visibleConf {
                                    TextField("***********", text: self.$passConf)
                                        .background(Color("white"))
                                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                                        .autocapitalization(.none)
                                    
                                } else {
                                    SecureField("***********", text: self.$passConf)
                                        .background(Color("white"))
                                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                                        .autocapitalization(.none)
                                }
                                
                                Button(action: {
                                    self.visibleConf.toggle()
                                }){
                                    Image(systemName:  self.visible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(Color("lightPurple"))
                                }
                            }
                        }
                    }
                    .frame(width: 280, height: 50, alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    Button(action: {
                        register()
//                        signUp()
                    }, label: {
                        Text("REGISTER")
                            .padding(EdgeInsets(top: 11, leading: 60, bottom: 11, trailing: 60))
                            .background(Color("lightPurple"))
                            .foregroundColor(Color("white"))
                            .cornerRadius(10)
                    })
                    .padding(.top, 20)
//                    .alert(isPresented: $showingAlert, content: {
//                        Alert(title: Text(alertTitle), message: Text(errorMessage), dismissButton: .default(Text("Sure thing")))
//                    })
                }

            }
            Spacer()
        }
        .alert("Error signing in", isPresented: self.$alert){
            ErrorView(error: self.$error, alert: self.$alert)
        }
    }
}
