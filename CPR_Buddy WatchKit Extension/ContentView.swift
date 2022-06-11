//
//  ContentView.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var presentAboutView = false
    
    var body: some View {
        NavigationView {
        VStack(spacing: 20) {
            Button("Hands-Only CPR") {
                print("Button tapped!")
            }.buttonStyle(BorderedButtonStyle(tint: .blue))
            Button("Traditional CPR") {
                print("Button tapped!")
            }.buttonStyle(BorderedButtonStyle(tint: .pink))
            Button("About CPR") {
                presentAboutView.toggle()
            }.buttonStyle(BorderedButtonStyle(tint: .orange))
                .fullScreenCover(isPresented: $presentAboutView) {
                    AboutView(isPresented: $presentAboutView)
                }
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
