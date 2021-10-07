//
//  ContentView.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/16.
//

import SwiftUI

struct ContentView: View {
    let neonPink = UIColor(red: 107/255, green: 70/255, blue: 246/255, alpha: 1.0)
        init()
        {
            UITabBar.appearance().backgroundColor = neonPink
        }
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
