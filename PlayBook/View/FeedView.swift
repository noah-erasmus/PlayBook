//
//  FeedView.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/29.
//

import SwiftUI

struct Item {
    let uuid = UUID()
    let value: String
}

struct FeedView: View {
    
    @ObservedObject var viewModel = PostsViewModel()
    @StateObject var profileService = ProfileService()
    
    var body: some View {
        ZStack{
            Color("offwhite")
            ZStack {
                ScrollView {
                    VStack {
                        ZStack {
                            Color("white")
                                .shadow(radius: 5)
                            VStack(alignment: .leading) {
                                Text("Hot Plays")
                                    .fontWeight(.bold)
                                ScrollView(.horizontal) {
                                    HStack {
                                        Image("leagueCap")
                                            .renderingMode(.original)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                            .frame(width: .infinity, height: 100, alignment: .leading)
                                        Image("leagueCap")
                                            .renderingMode(.original)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                            .frame(width: .infinity, height: 100, alignment: .leading)
                                        Image("leagueCap")
                                            .renderingMode(.original)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                            .frame(width: .infinity, height: 100, alignment: .leading)
                                        Image("leagueCap")
                                            .renderingMode(.original)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                            .frame(width: .infinity, height: 100, alignment: .leading)
                                    }
                                }
                                    
                                
                            }
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 10, trailing: 0))
                        }
                        ForEach(self.profileService.posts){(post) in
                            MiniPostView(post: post)
                        }
                        
//                        List(FirebaseService.loadPosts(){ post in
//                            MiniPostView(post: post)
//                        }
                    }
                }
                .listStyle(PlainListStyle())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar {
                    NavigationLink(
                        destination: ContentView()
                            .navigationBarTitle("Filter", displayMode: .inline),
                        label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                    )
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            print("action button clicked")
                        }, label: {
                            NavigationLink(destination: NewPostView()){
                                Text("+")
                                    .font(.system(.largeTitle))
                                    .frame(width: 77, height: 70)
                                    .foregroundColor(Color.white)
                                    .padding(.bottom, 7)
                            }
                        })
                        .background(Color("lightPurple"))
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                    }
                }
            }
            
            
        }
        .navigationTitle("Feed")
        .onAppear{
            self.profileService.loadPosts()
        }
    }
}



struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

