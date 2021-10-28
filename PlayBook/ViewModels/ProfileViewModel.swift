//
//  ProfileViewModel.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/28.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import Combine

class ProfileViewModel: ObservableObject {
    @Published var userInfo = User(userName: "", email: "", posts: [], followers: 0, following: 0, bio: "", imageUrl: "")
    @Published var picker = false
    @Published var imgData = Data(count:0)
    
    @Published var isLoading = false
    
    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
//    @Published var username = ""
//    @Published var email = ""
//    @Published var bio = ""
//    @Published var imageData = Data(count: 0)
//    @Published var picker = false
    
    init(){
        fetchCurUser()
//        FirebaseService.fetchUser(uid: UserDefaults.standard.value(forKey: "user") as? String ?? ""){(user) in
//            self.username = user.userName
//            self.email = user.email
//            self.imageData = user.imageUrl
//            self.bio = user.bio
//        }
    }
    
    func fetchCurUser(){
        db.collection("users").document(uid).getDocument{(doc,err) in
            guard let user = doc else {return}
            
            let username = user.data()?["username"] as! String
            let bio = user.data()?["bio"] as! String
            let image = user.data()?["picture"] as! String
            let email = user.data()?["email"] as! String
            
            DispatchQueue.main.async {
                self.userInfo = User(userName: username, email: email, posts: [], followers: 0, following: 0, bio: bio, imageUrl: image)
            }
        }
    }
    
    func updateImage(){
        isLoading = true
        UploadImage(imagedata: imgData, path: "profile_Photos"){(url) in
            self.db.collection("users").document(self.uid).updateData([
                "picture": url,
            ]){(err) in
                if err != nil {return}
                
                self.isLoading = false
                self.fetchCurUser()
            }
        }
    }
    
}
