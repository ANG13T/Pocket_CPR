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
    @State private var compressionRate = 100.0
    @State private var colorScheme = 1
    @State private var selectedColor : Color = .blue
    
    var body: some View {
        VStack {
            
            Text("Settings").bold().font(.system(size: 20))
            Slider(
                value: $compressionRate,
                in: 100...120,
                step: 1
            )
            
            Text("Compressions Per Minute: \(compressionRate)")
                .foregroundColor(.blue).font(.system(size: 20))
            
            VStack {
                List {
                    HStack {
                        Text("Pulse Color")
                        
                        Spacer()
                        
                        Image(systemName: "circle.fill").foregroundColor(selectedColor)
                    }
                }
                .foregroundColor(Color.white)
            }.fullScreenCover(isPresented: $presentColorPicker) {
                TraditionalTutorialView(isPresented: $presentColorPicker).toolbar {
                    
                    ToolbarItem(placement: .cancellationAction) {
                        
                        Button(action: {
                            presentColorPicker.toggle()
                        }) {
                            Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                        }
                        
                    }
                    
                }
            }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
            
            
            Text("Vibrations")
            
        }
    }
}

