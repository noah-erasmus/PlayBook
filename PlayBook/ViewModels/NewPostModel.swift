//
//  NewPostModel.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/28.
//

import SwiftUI

class NewPostModel: ObservableObject {
    @Published var postTxt = ""
    @Published var picker = false
    @Published var imgData = Data(count: 0)
    
    func post() {
        
    }
}
