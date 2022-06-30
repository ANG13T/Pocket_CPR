//
//  SettingsView.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/29/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    @State var presentColorPicker: Bool = false
    @State var vibrationStatus: Bool = true //
    @State var colorSelection: Color = Color.blue //
    @State private var compressionRate = 100.0 //
    @State private var colorScheme = 1
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("Settings").bold().font(.system(size: 20))
                Slider(
                    value: $compressionRate,
                    in: 100...120,
                    step: 1
                )
                
                Text("Compressions Per Minute: \(String(format: "%.0f", compressionRate))")
                    .foregroundColor(.blue).font(.system(size: 13))
                
                
                HStack {
                    Text("Pulse Color")
                    Spacer()
                    Image(systemName: "circle.fill").foregroundColor(colorSelection)
                }
                .foregroundColor(Color.white).onTapGesture {
                    presentColorPicker = true
                }.fullScreenCover(isPresented: $presentColorPicker) {
                    ColorPickerView(isPresented: $presentColorPicker, selection: $colorSelection).toolbar {
                        
                        ToolbarItem(placement: .cancellationAction) {
                            
                            Button(action: {
                                presentColorPicker.toggle()
                            }) {
                                Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                            }
                            
                        }
                        
                    }
                }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                
                
                Toggle(isOn: $vibrationStatus) {
                    Text("Vibrations")
                }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                
            }
        }
    }
}



