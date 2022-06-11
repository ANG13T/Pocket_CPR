//
//  ContentView.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var presentAboutView = false
    @State private var presentHandsOnlyView = false
    @State private var presentTraditionalView = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Button("Hands-Only CPR") {
                    presentHandsOnlyView.toggle()
                }.buttonStyle(BorderedButtonStyle(tint: .blue))
                    .fullScreenCover(isPresented: $presentHandsOnlyView) {
                        AboutView(isPresented: $presentHandsOnlyView)
                    }
                
                Button("Traditional CPR") {
                    presentTraditionalView.toggle()
                }.buttonStyle(BorderedButtonStyle(tint: .pink))
                    .fullScreenCover(isPresented: $presentTraditionalView) {
                        AboutView(isPresented: $presentTraditionalView)
                    }
                
                
                Button("About CPR") {
                    presentAboutView.toggle()
                }.buttonStyle(BorderedButtonStyle(tint: .orange))
                    .fullScreenCover(isPresented: $presentAboutView) {
                        AboutView(isPresented: $presentAboutView).toolbar {
                            
                            ToolbarItem(placement: .cancellationAction) {
                                
                                Button("Cancel") {
                                    presentAboutView.toggle()
                                }
                                
                            }
                            
                        }
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
