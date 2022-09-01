//
//  TraditionalView.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/11/22.
//

import SwiftUI

struct TraditionalView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject private var userSettings: UserSettings
    @State private var presentTimerView = false
    @State private var clickTimer : Timer?
    @State private var progressTimer : Timer?
    @State private var presentTutorialView = false
    @State private var presentDisplay = false
    
    private var WarningSettingsView: some View {
        VStack {
            Text("**Settings Tip**")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
            Text("For best performance, go to **Settings > Display & Brightness > Wake Duration > 70 seconds**").font(SizeResponsive().getSubtextFont())
                .multilineTextAlignment(.center)
                .padding(.top, 10)
        }
    }
    
    private var completedTimer: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.black.opacity(0.7))
            .frame(width: WKInterfaceDevice.current().screenBounds.width, height: WKInterfaceDevice.current().screenBounds.height)
            .overlay(
                VStack {
                    Text("**Timer Complete!**")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                    Image(systemName: "checkmark")
                        .font(.system(size: 30)).padding([.top, .bottom], 20)
                    
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Text("Close")
                    }).buttonStyle(BorderedButtonStyle(tint: .blue))
                }
            )
    }
    
    var body: some View {
        TabView(selection: $userSettings.settingsTab) {
            NavigationView {
                VStack {
                    VStack {
                        VStack {
                            Text("**Traditional CPR**")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 5)
                            
                            
                            Button("Start Timer") {
                                presentTimerView.toggle()
                                clickTimer?.invalidate()
                                progressTimer?.invalidate()
                            }.buttonStyle(BorderedButtonStyle(tint: .blue))
                                .fullScreenCover(isPresented: $presentTimerView) {
                                    TraditionalTimerView(isPresented: $presentTimerView, clickTimer: $clickTimer, progressTimer: $progressTimer).toolbar {
                                        
                                        ToolbarItem(placement: .cancellationAction) {
                                            
                                            
                                            Button(action: {
                                                presentTimerView.toggle()
                                                clickTimer?.invalidate()
                                                progressTimer?.invalidate()
                                            }) {
                                                Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                                            }
                                            
                                        }
                                        
                                    }
                                }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .blue)).padding(.top, 5)
                                .padding(.bottom, 10)
                            
                            Button("Tutorial") {
                                presentTutorialView.toggle()
                            }.buttonStyle(BorderedButtonStyle(tint: .pink))
                                .fullScreenCover(isPresented: $presentTutorialView) {
                                    TraditionalTutorialView(isPresented: $presentTutorialView).toolbar {
                                        
                                        ToolbarItem(placement: .cancellationAction) {
                                            
                                            Button(action: {
                                                presentTutorialView.toggle()
                                            }) {
                                                Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                                            }
                                            
                                        }
                                        
                                    }
                                }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                            
                            
                        }
                        .opacity(0.8)
                        .padding(1)
                    }
                    
                    Spacer()
                }
            }.tag(Tab.tabOne)
            
            NavigationView {
                
                VStack {
                    Text("**Settings Tip**")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                    Text("For best performance, go to **Settings > Display & Brightness > Wake Duration > 70 seconds**").font(SizeResponsive().getSubtextFont()).frame(height: 80)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                    Button("Got it") {
                        userSettings.showedSettings()
                    }.buttonStyle(BorderedButtonStyle(tint: .orange))
                }
            }.tag(Tab.tabTwo)
            
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

