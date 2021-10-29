//
//  ContentView.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/16.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
//    @EnvironmentObject var session: Session
    let lightPurple = UIColor(red: 107/255, green: 70/255, blue: 246/255, alpha: 1.0)
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    
    var body: some View {
            ZStack{
                if self.status {
                    TabView{
                        NavigationView{
                            FeedView()
                                .navigationTitle("Feed")
                                .toolbar {
                                    NavigationLink(
                                        destination: NewPostView()
                                            .navigationBarTitle("New Post", displayMode: .inline),
                                        label: {
                                            Image(systemName: "plus")
                                        }
                                    )
                                }
                        }
                        .tabItem{Label("Feed", systemImage: "book")}
                        NavigationView{
                            ProfileView()
                                .navigationTitle("Profile")
                                .toolbar {
                                    Button(action:{
                                        try! Auth.auth().signOut()
                                        UserDefaults.standard.set(false, forKey: "status")
                                        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                                    }){
                                        Image(systemName: "escape")
                                    }
                                }
                        }
                        .tabItem{Label("Profile", systemImage: "gear")}
                        
                    }
                } else {
                    LoginView()
                }
                
            }
            .onAppear{
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main){(_) in
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    
                }
            }
//            if session.isLoggedIn == false {
//                LoginView()
//                    .environmentObject(session)
//            } else if session.isLoggedIn == false {
//                FeedView()
//            }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
