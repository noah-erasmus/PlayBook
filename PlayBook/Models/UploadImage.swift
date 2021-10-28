//
//  UploadImage.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/28.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage

func UploadImage(imagedata: Data, path: String, completion: @escaping(String) -> ()){
    let storage = Storage.storage().reference()
    let uid = Auth.auth().currentUser!.uid
    
    storage.child(path).child(uid).putData(imagedata, metadata: nil){(_,err) in
        if err != nil {
            completion("")
            return
        }
        
        storage.child(path).child(uid).downloadURL{(url,err) in
            if err != nil {
                completion("")
                return
            }
            
            completion("\(url!)")
        }
    }
}
