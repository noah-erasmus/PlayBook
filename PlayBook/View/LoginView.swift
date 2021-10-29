//
//  LoginView.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/07.
//

//import SwiftUI
//
//struct LoginView: View {
//    @State private var emailVal: String = ""
//    @State private var passwordVal: String = ""
//
//    @State var errorMessage = ""
//    @State var showingAlert = false
//    @State var errorTitle = ""
//
//    @EnvironmentObject var session: Session
//
//    func errorCheck() -> String? {
//        if emailVal.trimmingCharacters(in: .whitespaces).isEmpty ||
//            passwordVal.trimmingCharacters(in: .whitespaces).isEmpty {
//            print("click")
//            return "Please fill in all the above information."
//        }
//        return nil
//    }
//
//    func clear(){
//        self.emailVal = ""
//        self.passwordVal = ""
//    }
//
//    func signIn(){
//        if let error = errorCheck(){
//            self.errorMessage = error
//            self.showingAlert = true
//            return
//        }
//
//        AuthService.signIn(email: emailVal, password: passwordVal, onSuccess: {(user) in
//            self.clear()
//            return
//        }, onError: {(errorMessage) in
//            print("Error \(errorMessage)")
//            self.errorMessage = errorMessage
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
//            .frame(width:.infinity, height: 200)
//            ZStack {
//                Color("offwhite")
//                VStack{
//                    HStack{
//                        Text("Login")
//                            .fontWeight(.bold)
//                            .underline(true, color: Color("lightPurple"))
//                        Text("Register")
//                        Spacer()
//                    }
//                    .padding(.leading, 20)
//                    .padding(.bottom, 30)
//                    ZStack{
//                        Color("white")
//                            .cornerRadius(5)
//                            .shadow(radius: 2)
//                        VStack(alignment: .leading, spacing: 0){
//                            Text("Email")
//                                .foregroundColor(Color("lightPurple"))
//                                .font(.system(size: 10))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
//                            TextField("legend27@gmail.com", text: $emailVal)
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
//                            Text("Password")
//                                .foregroundColor(Color("lightPurple"))
//                                .font(.system(size: 10))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
//                            TextField("***********", text: $passwordVal)
//                                .background(Color("white"))
//                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
//                        }
//                    }
//                    .frame(width: 280, height: 50, alignment: .leading)
//                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
//                    Button(action: {
//                        print("CLicked login")
//                        signIn()
//                        session.isLoggedIn = true
//                    }, label: {
//                        Text("LOGIN")
//                            .padding(EdgeInsets(top: 11, leading: 60, bottom: 11, trailing: 60))
//                            .background(Color("lightPurple"))
//                            .foregroundColor(Color("white"))
//                            .cornerRadius(10)
//                    })
//                    .padding(.top, 20)
//                    .alert(isPresented: $showingAlert, content: {
//                        Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Sure Thing")))
//                    })
//                }
//
//            }
//            Spacer()
//        }
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView().environmentObject(Session())
//    }
//}

// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------


import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @State var error = ""
    @State var alert = false
    
    func clear(){
        self.email = ""
        self.pass = ""
    }
    
    func resetPassword(){
        
        if self.email != "" {
            AuthService.resetPassword(email: self.email, onError: {(err) in
                self.error = err
                self.alert.toggle()
                return
            })
            self.error = "RESET"
            self.alert.toggle()
        } else {
            self.error = "Email Id is empty"
            self.alert.toggle()
        }
    }
    
    func login(){
        if self.email != "" && self.pass != "" {
            AuthService.login(email: email, pass: pass, onSuccess: {(userId) in
                self.clear()
                UserDefaults.standard.set(userId, forKey: "user")
            }, onError: {(error) in
                self.error = "There was an error logging in!"
                self.alert.toggle()
            })
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
            .frame(maxWidth: .infinity, maxHeight: 200)
            ZStack {
                Color("offwhite")
                VStack{
                    HStack{
                        Text("Login")
                            .fontWeight(.bold)
                            .underline(true, color: Color("lightPurple"))
                        NavigationLink(destination: RegisterView()){
                            Text("Register")
                        }
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 30)
                    //Email Field
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
                    ZStack{
                        Color("white")
                            .cornerRadius(5)
                            .shadow(radius: 2)
                        VStack(alignment: .leading, spacing: 0){
                            Text("Password")
                                .foregroundColor(Color("lightPurple"))
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                            HStack {
                                if self.visible{
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
                    HStack{
                        Spacer()
                        
                        Button(action:{
                            resetPassword()
                        }){
                            Text("Forgot password?")
                                .fontWeight(.bold)
                                .foregroundColor(Color("lightPurple"))
                        }
                        
                    }
                    Button(action: {
                        print("Clicked login")
                        login()
//                        signIn()
//                        session.isLoggedIn = true
                    }, label: {
                        Text("LOGIN")
                            .padding(EdgeInsets(top: 11, leading: 60, bottom: 11, trailing: 60))
                            .background(Color("lightPurple"))
                            .foregroundColor(Color("white"))
                            .cornerRadius(10)
                    })
                    .padding(.top, 20)
                }

            }
            Spacer()
        }
        .alert(isPresented: self.$alert){
//            ErrorView(error: self.$error, alert: self.$alert)
            Alert(
                title: Text(self.error == "RESET" ? "Message" : "Error"),
                message: Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error),
                dismissButton: .default(Text(self.error == "RESET" ? "Ok" : "Cancel"))
            )
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
        
    }
    
}
