//
//  FirebaseService.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/23.
//

import Foundation
import FirebaseFirestore
import Firebase

class FirebaseService {
    
    // instance of db
    static var db = Firestore.firestore()
    
    //add our new user register to our db
    static func addNewUser(uid: String, username: String, email: String){
        db.collection("users").document(uid).setData([
            "username": username,
            "email": email
        ]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            }else {
                print("Document added successfully")
            }
        }
    }
}
