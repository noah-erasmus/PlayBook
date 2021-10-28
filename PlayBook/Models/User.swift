//
//  User.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/20.
//

import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift

struct User {
    var userName: String
    var email: String
    var posts: [Post]
    var followers: Int
    var following: Int
    var bio: String
    var imageUrl: String

//    enum CodingKeys: String, CodingKey {
//        case id
//        case userName
//        case email
//        case posts
//        case followers
//        case following
//        case bio
//        case imageUrl
//
//    }

}

// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------


