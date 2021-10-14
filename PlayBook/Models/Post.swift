//
//  Post.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/14.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var postId: String
    var image: String
    var caption: String
    var date: Double
    var likes: Int
    var ownerId: String
    
}
