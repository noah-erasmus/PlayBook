//
//  PostsViewModel.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/14.
//

import FirebaseFirestore
import Combine

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var noPosts = false
    @Published var newPost = false
    
    let db = Firestore.firestore()
    
    init(){
//        FirebaseService.loadAllPosts(onSuccess: {(allPosts) in
//            print(allPosts)
//            self.posts = allPosts
//        }, onError: {(noposts) in
//            if noposts {self.noPosts = true}
//        })
        loadAllPosts()
    }
    
    func loadAllPosts(){
        db.collection("posts").addSnapshotListener{(snap, err) in
            guard let docs = snap else {return}

            docs.documentChanges.forEach{(doc) in
                if doc.type == .added{
                    let caption = doc.document.data()["caption"] as! String
                    let likes = doc.document.data()["likes"] as? Int ?? 0
                    let ownerRef = doc.document.data()["ownerId"] as! String
                    let image = doc.document.data()["image"] as? String ?? ""
                    let time = doc.document.data()["time"] as! Timestamp


                    FirebaseService.fetchUser(uid: ownerRef){(user) in
                        self.posts.append(Post(id: doc.document.documentID, image: image, caption: caption, likes: likes, owner: user, time:time.dateValue()))
                    }

//                    fetchUser(uid: ownerRef, onSuccess: {(user) in
//                        posts.append(Post(id: doc.document.documentID, image: image, caption: caption, date: date, likes: likes, owner: user))
//                    })


                }
            }
        }
    }


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
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
