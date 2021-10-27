//
//  PostsViewModel.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/14.
//

//import Foundation
//import FirebaseFirestore
//
//class PostsViewModel: ObservableObject {
//    @Published var posts = [Post]()
//
//    private var db = Firestore.firestore()
//
//    func fetchData() {
//        db.collection("posts").addSnapshotListener{(querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("no docs")
//                return
//            }
//
//            self.posts = documents.map{ queryDocumentSnapshot -> Post in
//                let data = queryDocumentSnapshot.data()
//                let ownerId = data["ownerId"] as? String ?? ""
//                let postId = data["postId"] as? String ?? ""
//                let image = data["image"] as? String ?? ""
//                let caption = data["caption"] as? String ?? ""
//                let date = data["date"] as? Double ?? 0
//                let likes = data["likes"] as? Int ?? 0
//
//                return Post(id: .init(), postId: postId, image: image, caption: caption, date: date, likes: likes, ownerId: ownerId )
//            }
//        }
//    }
//}

// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
