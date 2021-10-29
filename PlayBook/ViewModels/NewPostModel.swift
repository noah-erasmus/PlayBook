//
//  NewPostModel.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/28.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class NewPostModel: ObservableObject {
    @Published var postTxt = "Write a caption..."
    @Published var picker = false
    @Published var imgData = Data(count: 0)
    @Published var isPosting = false
    
    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    func post(present: Binding<PresentationMode>) {
        isPosting = true
        
        if imgData.count == 0 {
            isPosting = false
            return
        } else {
            UploadImage(imagedata: imgData, path: "post_Pics"){(url) in
                self.db.collection("posts").document().setData([
                    "caption":self.postTxt,
                    "image":url,
                    "time":Date(),
                    "likes":0,
                    "ownerId":Auth.auth().currentUser!.uid,
                ]){(err) in
                    if err != nil {
                        self.isPosting = false
                        return
                    }
                    
                    self.isPosting = false
                    
                    present.wrappedValue.dismiss()
                }
            }
        }
    }
}
