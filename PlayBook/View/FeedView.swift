//
//  FeedView.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/29.
//

import SwiftUI

struct FeedView: View {
    
    let lightPurple = UIColor(red: 107/255, green: 70/255, blue: 246/255, alpha: 1.0)
    
    init() {
      let coloredAppearance = UINavigationBarAppearance()
      coloredAppearance.configureWithOpaqueBackground()
      coloredAppearance.backgroundColor = lightPurple
      coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
      coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
      
      UINavigationBar.appearance().standardAppearance = coloredAppearance
      UINavigationBar.appearance().compactAppearance = coloredAppearance
      UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
      
      UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        ZStack{
            Color("offWhite")
            Text("Hello World!")
        }
    }
}



struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

