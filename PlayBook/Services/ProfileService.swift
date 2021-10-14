//
//  ProfileService.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/14.
//

import Foundation

class ProfileService: ObservableObject {
    
    @Published var posts: [Post] = []
    
    func loadPosts() {
        FirebaseService.loadPosts() {
            (posts) in
            
            self.posts = posts
        }
    }
}
