//
//  ContentView.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/9/22.
//

import SwiftUI


struct HandsOnlyOptionCard : View {
    @Binding public var presentHandsOnlyView : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(systemName: "hand.raised").foregroundColor(.blue).font(.system(size: 25))
            Text("Hands-Only CPR")
            Button("**BEGIN**") {
                presentHandsOnlyView.toggle()
            }.foregroundColor(.blue)
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
        }.padding()
    }
}

struct TraditionalOptionCard : View {
    @Binding public var presentTraditionalView : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(systemName: "heart").foregroundColor(.pink).font(.system(size: 25))
            Text("Traditional CPR")
            Button("**BEGIN**") {
                presentTraditionalView.toggle()
            }.foregroundColor(.pink)
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
        }.padding()
    }
}


struct AboutOptionCard : View {
    @Binding public var presentAboutView : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("About CPR")
            Image(systemName: "heart").foregroundColor(.orange).font(.system(size: 25))
            Button("**BEGIN**") {
                presentAboutView.toggle()
            }.foregroundColor(.orange)
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
        }.padding()
    }
}

struct SettingsOptionCard : View {
    @Binding public var presentSettingsView : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Settings")
            Image(systemName: "gearshape").foregroundColor(.green).font(.system(size: 25))
            Button("**BEGIN**") {
                presentSettingsView.toggle()
            }.foregroundColor(.green)
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
        }.padding()
    }
}


struct ContentView: View {
    @State private var presentAboutView = false
    @State private var presentTraditionalView = false
    @State private var presentSettingsView = false
    @State private var presentHandsOnlyView = false
    
    var body: some View {
        NavigationView {
            List {
                HandsOnlyOptionCard(presentHandsOnlyView: $presentHandsOnlyView)
                
                TraditionalOptionCard(presentTraditionalView: $presentTraditionalView)
                
                AboutOptionCard(presentAboutView: $presentAboutView)
                
                SettingsOptionCard(presentSettingsView: $presentSettingsView)
                
            }.listStyle(CarouselListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
