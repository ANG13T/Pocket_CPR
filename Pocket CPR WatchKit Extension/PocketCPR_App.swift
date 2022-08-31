//
//  PocketCPR_App.swift
//  PocketCPR_App WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/9/22.
//

import SwiftUI

@main
struct PocketCPR_App: App {
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().environmentObject(UserSettings(vibration: true, color: Color.blue, compressionRate: 100.0, breathsColor: Color.green, showSettingsWarning: true)).toolbar {
                    
                    ToolbarItem(placement: .cancellationAction) {
                        
                        Text("Pocket CPR").bold().foregroundColor(Color.white)
                        
                    }
                    
                }
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
