//
//  CPR_BuddyApp.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/9/22.
//

import SwiftUI

@main
struct CPR_BuddyApp: App {
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
