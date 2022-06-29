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
    @State private var presentSettingsView = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    Button("Hands-Only CPR") {
                        presentHandsOnlyView.toggle()
                    }.buttonStyle(BorderedButtonStyle(tint: .blue))
                        .fullScreenCover(isPresented: $presentHandsOnlyView) {
                            HandsOnlyView(isPresented: $presentHandsOnlyView).toolbar {
                                
                                ToolbarItem(placement: .cancellationAction) {
                                    
                                    Button(action: {
                                        presentHandsOnlyView.toggle()
                                    }) {
                                        Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                                    }
                                    
                                }
                                
                            }
                        }.padding(.top, 10)
                    
                    Button("Traditional CPR") {
                        presentTraditionalView.toggle()
                    }.buttonStyle(BorderedButtonStyle(tint: .pink))
                        .fullScreenCover(isPresented: $presentTraditionalView) {
                            TraditionalView(isPresented: $presentTraditionalView).toolbar {
                                
                                ToolbarItem(placement: .cancellationAction) {
                                    
                                    Button(action: {
                                        presentTraditionalView.toggle()
                                    }) {
                                        Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                                    }
                                    
                                }
                                
                            }
                        }
                    
                    
                    Button("About CPR") {
                        presentAboutView.toggle()
                    }.buttonStyle(BorderedButtonStyle(tint: .orange))
                        .fullScreenCover(isPresented: $presentAboutView) {
                            AboutView(isPresented: $presentAboutView).toolbar {
                                
                                ToolbarItem(placement: .cancellationAction) {
                                    
                                    Button(action: {
                                        presentAboutView.toggle()
                                    }) {
                                        Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                                    }
                                    
                                }
                                
                            }
                        }
                    
                    Button("Settings") {
                        presentSettingsView.toggle()
                    }.buttonStyle(BorderedButtonStyle(tint: .green))
                        .fullScreenCover(isPresented: $presentSettingsView) {
                            SettingsView(isPresented: $presentSettingsView).toolbar {
                                
                                ToolbarItem(placement: .cancellationAction) {
                                    
                                    Button(action: {
                                        presentSettingsView.toggle()
                                    }) {
                                        Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                                    }
                                    
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
