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
            Image(systemName: "hand.raised.fill").foregroundColor(.blue).font(.system(size: 30)).padding(.top, 5)
            Text("Hands-Only CPR").bold().padding(.top, 5)
            Button("**BEGIN**") {
                presentHandsOnlyView.toggle()
            }.foregroundColor(.blue).padding(.bottom, 5)
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
                }
        }.padding()
    }
}

struct TraditionalOptionCard : View {
    @Binding public var presentTraditionalView : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(systemName: "heart.fill").foregroundColor(.pink).font(.system(size: 30)).padding(.top, 5)
            Text("Traditional CPR").bold().padding(.top, 5)
            Button("**BEGIN**") {
                presentTraditionalView.toggle()
            }.foregroundColor(.pink).padding(.bottom, 5)
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
            Image(systemName: "text.book.closed.fill").foregroundColor(.orange).font(.system(size: 30)).padding(.top, 5)
            Text("About CPR").bold().padding(.top, 5)
            Button("**BEGIN**") {
                presentAboutView.toggle()
            }.foregroundColor(.orange).padding(.bottom, 5)
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
            Image(systemName: "gearshape.fill").foregroundColor(.green).font(.system(size: 30)).padding(.top, 5)
            Text("Settings").bold().padding(.top, 5)
            Button("**ENTER**") {
                presentSettingsView.toggle()
                print(WKInterfaceDevice.currentResolution())
            }.foregroundColor(.green).padding(.bottom, 5)
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

struct SourcesOptionCard : View {
    @Binding public var presentSourcesView : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(systemName: "doc.text").foregroundColor(.green).font(.system(size: 30)).padding(.top, 5)
            Text("Sources").bold().padding(.top, 5)
            Button("**ENTER**") {
                presentSettingsView.toggle()
                print(WKInterfaceDevice.currentResolution())
            }.foregroundColor(.green).padding(.bottom, 5)
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
    @State private var presentSourcesView = false
    
    var body: some View {
        NavigationView {
            List {
                HandsOnlyOptionCard(presentHandsOnlyView: $presentHandsOnlyView)
                
                TraditionalOptionCard(presentTraditionalView: $presentTraditionalView)
                
                AboutOptionCard(presentAboutView: $presentAboutView)
                
                SettingsOptionCard(presentSettingsView: $presentSettingsView)
                
                SourcesOptionCard(presentSourcesView: $presentSourcesView)
                
            }.listStyle(CarouselListStyle()).environment(\.defaultMinListRowHeight, 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
