//
//  ContentView.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Hands-Only CPR") {
                print("Button tapped!")
            }.buttonStyle(BorderedButtonStyle(tint: .blue))
            Button("Traditional CPR") {
                print("Button tapped!")
            }.buttonStyle(BorderedButtonStyle(tint: .pink))
            Button("About CPR") {
                print("Button tapped!")
            }.buttonStyle(BorderedButtonStyle(tint: .orange))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
