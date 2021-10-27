//
//  PlayBookApp.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/16.
//

import SwiftUI
import Firebase

@main
struct PlayBookApp: App {
//    @StateObject var userAuth = UserAuth()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environmentObject(userAuth)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print("Firebase...")
        FirebaseApp.configure()

        return true
    }
}
