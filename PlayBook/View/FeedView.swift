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
            Color("offwhite")
            NavigationView{
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
                        MiniPostView()
                        MiniPostView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Feed")
                .toolbar {
                    NavigationLink(
                        destination: ContentView()
                            .navigationBarTitle("Filter", displayMode: .inline),
                        label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                    )
                }
            }
        }
    }
}



struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

