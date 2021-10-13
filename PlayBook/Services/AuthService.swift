//
//  AuthService.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/23.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    
    static var auth = Auth.auth()
    
    static func signUp(username: String, email: String, password: String, onSuccess: @escaping (_ user:String) -> Void, onError: @escaping (_ errorMessage: String) -> Void){
        auth.createUser(withEmail: email, password: password){
            (authData, error) in
            if(error != nil){
                onError(error!.localizedDescription)
                return
            }
            guard let userId = authData?.user.uid else {return}
            FirebaseService.addNewUser(uid: userId, username: username, email: email)
            onSuccess(userId)
        }
    }
    
    static func signIn(email: String, password: String, onSuccess: @escaping (_ user: String) -> Void, onError: @escaping(_ errorMessage: String) -> Void){
        auth.signIn(withEmail: email, password: password){
            (authData, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else {return}
            
            onSuccess(userId)
        }
    }
}
