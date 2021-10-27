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
    
    static func login(email: String, pass: String, onSuccess: @escaping (_ userId:String) -> Void ,onError: @escaping (_ error:String) -> Void){
        auth.signIn(withEmail: email, password: pass) { (res,err) in
            if err != nil{
                onError(err!.localizedDescription)
                return
            }
            
            guard let userId = res?.user.uid else {return}
            
            onSuccess(userId)
            UserDefaults.standard.set(true, forKey: "status")
            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
        }
        
    }
    
    static func register(username:String,email:String,password:String,onSuccess:@escaping(_ userId:String) -> Void,onError:@escaping(_ error:String) -> Void){
        auth.createUser(withEmail: email, password: password){(res,err) in
            if err != nil {
                onError(err!.localizedDescription)
                return
            }
            
            guard let userId = res?.user.uid else {return}
            
            FirebaseService.addNewUser(uid: userId, username: username, email: email)
            onSuccess(userId)
        }
    }
    
    static func resetPassword(email:String, onError:@escaping(_ error:String) -> Void){
        auth.sendPasswordReset(withEmail: email){(err) in
            if err !=  nil {
                onError(err!.localizedDescription)
                return
            }
        }
    }

//    static func signUp(username: String, email: String, password: String, onSuccess: @escaping (_ user:String) -> Void, onError: @escaping (_ errorMessage: String) -> Void){
//        auth.createUser(withEmail: email, password: password){
//            (authData, error) in
//            if(error != nil){
//                onError(error!.localizedDescription)
//                return
//            }
//            guard let userId = authData?.user.uid else {return}
//            FirebaseService.addNewUser(uid: userId, username: username, email: email)
//            onSuccess(userId)
//        }
//    }
//
//    static func signIn(email: String, password: String, onSuccess: @escaping (_ user: String) -> Void, onError: @escaping(_ errorMessage: String) -> Void){
//        auth.signIn(withEmail: email, password: password){
//            (authData, error) in
//
//            if error != nil {
//                onError(error!.localizedDescription)
//                return
//            }
//
//            guard let userId = authData?.user.uid else {return}
//
//            onSuccess(userId)
//        }
//    }
}




// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
