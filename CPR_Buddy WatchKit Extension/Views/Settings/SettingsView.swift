//
//  SettingsView.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/29/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var userSettings: UserSettings
    @Binding var isPresented: Bool
    @State var presentColorPicker: Bool = false
    @State var presentBreathsColorPicker: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("Settings").bold().font(.system(size: 20))
                Slider(
                    value: $userSettings.compressionRate,
                    in: 100...120,
                    step: 1
                )
                
                Text("Compressions Per Minute: \(String(format: "%.0f", userSettings.compressionRate))")
                    .foregroundColor(.blue).font(.system(size: 13))
                
                
                HStack {
                    Text("Compression Pulse Color")
                    Spacer()
                    Image(systemName: "circle.fill").foregroundColor(userSettings.color)
                }
                .foregroundColor(Color.white).onTapGesture {
                    presentColorPicker = true
                }.fullScreenCover(isPresented: $presentColorPicker) {
                    ColorPickerView(isPresented: $presentColorPicker, selection: $userSettings.color).toolbar {
                        
                        ToolbarItem(placement: .cancellationAction) {
                            
                            Button(action: {
                                presentColorPicker.toggle()
                            }) {
                                Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                            }
                            
                        }
                        
                    }
                }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                
                HStack {
                    Text("Breaths Pulse Color")
                    Spacer()
                    Image(systemName: "circle.fill").foregroundColor(userSettings.breathsColor)
                }
                .foregroundColor(Color.white).onTapGesture {
                    presentBreathsColorPicker = true
                }.fullScreenCover(isPresented: $presentBreathsColorPicker) {
                    ColorPickerView(isPresented: $presentBreathsColorPicker, selection: $userSettings.breathsColor).toolbar {
                        
                        ToolbarItem(placement: .cancellationAction) {
                            
                            Button(action: {
                                presentBreathsColorPicker.toggle()
                            }) {
                                Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                            }
                            
                        }
                        
                    }
                }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                
                
                Toggle(isOn: $userSettings.vibration) {
                    Text("Vibrations")
                }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                
            }
        }
    }
}



