//
//  FirebaseService.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/23.
//

//import Foundation
//import FirebaseFirestore
//import Firebase
//import FirebaseAuth
//import FirebaseFirestoreSwift
//
//class FirebaseService {
//
//    @Published var posts = [Post]()
//    @Published var user: User = User()
//
//    // instance of db
//    static var db = Firestore.firestore()
//
//    //add our new user register to our db
//    static func addNewUser(uid: String, username: String, email: String){
//        db.collection("users").document(uid).setData([
//            "username": username,
//            "email": email
//        ]) { error in
//            if let error = error {
//                print("Error writing document: \(error)")
//            }else {
//                print("Document added successfully")
//            }
//        }
//    }
//
////    static func updateProfile(uid: String, )
//
////    static func findUser(id: String, onSuccess: @escaping(_ user: User) -> Void) {
////        let userName = DocumentReference.
////        onSuccess( db.collection("users").document(id));
////    }
//
//    static func loadProfile(id: String, onSuccess: @escaping(_ user: User) -> Void) {
//        db.collection("users").document(id).getDocument{(document, error) in
//
//            if let document = document {
//                do {
//                    onSuccess(try document.data(as: User.self) ?? User())
//                } catch {
//                    print("failed to decode")
//                }
//            } else {
//                print ("Doc no exist")
//            }
//        }
//    }
//
//    static func loadPosts(onSuccess: @escaping(_ posts: [Post]) -> Void) {
//
//            db.collection("posts").getDocuments {
//                (snapshot, error) in
//
//                guard let snap = snapshot else {
//                    print("Error")
//                    return
//                }
//
//                var posts = [Post]()
//
//                for doc in snap.documents {
//                    let dict = doc.data()
//                    let ownerId = dict["ownerId"] as? String ?? ""
//                    let postId = dict["postId"] as? String ?? ""
//                    let image = dict["image"] as? String ?? ""
//                    let caption = dict["caption"] as? String ?? ""
//                    let date = dict["date"] as? Double ?? 0
//                    let likes = dict["likes"] as? Int ?? 0
//                    guard let decoder = try? Post.init(postId: postId, image: image, caption: caption, date: date, likes: likes, ownerId: ownerId)
//                    else {
//                        return
//                    }
//                    posts.append(decoder)
//                }
//                onSuccess(posts)
//            }
//        }
//
//
////    static func fetchPosts(){
////        var posts = [Post]()
////        db.collection("posts").getDocuments(){ (querySnapshot, err) in
////            guard let documents = querySnapshot?.documents else {
////                print("no docs")
////                return
////            }
////
////            self.posts = documents.map{(queryDocumentSnapshot) -> Post in
////                let data = queryDocumentSnapshot.data()
////                let ownerId = data["ownerId"] as? String ?? ""
////                let surname = data["surname"] as? String ?? ""
////                return User(name: name, surname: surname)
////            }
////            if let err = err {
////                print("Error getting documents: \(err)")
////            } else {
////                for document in querySnapshot!.documents {
////
////                    posts.append(document)
////                }
////                onSuccess(posts)
////            }
////        }
////    }
//
//    static func addNewPost(caption: String, imageUrl: String) {
//        db.collection("posts").document().setData([
//            "caption": caption,
//            "imageUrl": imageUrl,
//            "ownerId": Auth.auth().currentUser!.uid,
//            "likeCount": 0,
//            "date": Date().timeIntervalSince1970
//        ]) { error in
//            if let error = error {
//                print("Error writing document: \(error)")
//            } else {
//                print("Document added successfully")
//            }
//
//        }
//    }
//}




// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
  
import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class FirebaseService{
    static var db = Firestore.firestore()
    
    static func addNewUser(uid: String, username: String, email: String){
        db.collection("users").document(uid).setData([
            "username": username,
            "email": email,
            "posts": [],
            "followers": 0,
            "following": 0,
            "bio": "",
            "picture": ""
        ]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            }else {
                print("Document added successfully")
            }
        }
    }
}
