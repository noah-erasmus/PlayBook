//
//  FeedView.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/29.
//

import SwiftUI

struct FeedView: View {

    @StateObject var postData = PostsViewModel()
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
            Color("offwhite")
                ScrollView {
                    VStack {
                        if postData.posts.isEmpty {
                            if postData.noPosts {
                                Text("There are no posts.")
                            } else {
                                ProgressView()
                            }
                        } else {
                            ForEach(postData.posts){(post) in
                                MiniPostView(post: post)
                            }
                            
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
//
//
//
//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//    }
//}

// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------

//import SwiftUI
//import Firebase
//import FirebaseAuth
//
//struct FeedView: View {
//    var body: some View {
//        VStack {
//            Text("Logged successfully")
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(Color("lightPurple"))
//            Button(action: {
//                try! Auth.auth().signOut()
//                UserDefaults.standard.set(false, forKey: "status")
//                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
//            }){
//                Text("Log out")
//                    .foregroundColor(Color.black)
//                    .padding(.vertical)
//                    .frame(width: UIScreen.main.bounds.width - 50)
//            }
//        }
//    }
//}
