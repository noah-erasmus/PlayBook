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
    
//    static func loadAllPosts(onSuccess:@escaping(_ posts:[Post]) -> Void, onError:@escaping(_ noPosts:Bool) -> Void){
//        var posts: [Post] = []
//        db.collection("posts").addSnapshotListener{(snap,err) in
//            guard let docs = snap else {
//                onError(true)
//                return
//            }
//            
//            if docs.documentChanges.isEmpty{
//                onError(true)
//                return
//            }
//            
//            docs.documentChanges.forEach{(doc) in
//                if doc.type == .added{
//                    let caption = doc.document.data()["caption"] as! String
//                    let date = doc.document.data()["date"] as? Double ?? 34534
//                    let likes = doc.document.data()["likes"] as? Int ?? 0
//                    let ownerRef = doc.document.data()["ownerId"] as! String
//                    let image = doc.document.data()["imageUrl"] as? String ?? ""
//                    
//                    fetchUser(uid: ownerRef, onSuccess: {(user) in
//                        print(Post(id: doc.document.documentID, image: image, caption: caption, date: date, likes: likes, owner: user))
//                        posts.append(Post(id: doc.document.documentID, image: image, caption: caption, date: date, likes: likes, owner: user))
////                        print(posts)
//                    })
//                    
//                }
//            }
//            print(posts)
//            onSuccess(posts)
//        }
//    }
    
    static func fetchUser(uid:String,onSuccess:@escaping(_ user:User) -> Void){
        db.collection("users").document(uid).getDocument{(doc,err) in
            guard let user = doc else {return}
            
            let username = user.data()?["username"] as? String ?? ""
            let picture = user.data()?["picture"] as? String ?? ""
            let bio = user.data()?["bio"] as? String ?? ""
            let email = user.data()?["email"] as? String ?? ""
            
//            let followers = user.data()?["followers"] as! [User]
//            let following = user.data()?["username"] as! [User]
            
            print("user fetched")
            onSuccess(User(userName: username, email: email, posts: [], followers: 0, following: 0, bio: bio, imageUrl: picture))
        }
    }
}
