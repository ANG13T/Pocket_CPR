//
//  SettingsView.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/29/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    @State private var compressionRate = 100.0
    @State private var colorScheme = 1
    @State private var selectedColor : Color = .blue
    
    var body: some View {
        VStack {
            Text("Compressions Per Minute: \(compressionRate)")
                .foregroundColor(.blue)
            Slider(
                value: $compressionRate,
                in: 100...120,
                step: 1
            )
            
            VStack {
                List {
                    HStack {
                        Text("Color")
                        
                        Spacer()
                        
                        Image(systemName: "circle.fill").foregroundColor(selectedColor)
                    }
                }
                .foregroundColor(Color.white)
            }
            
            
//           Picker("Color Scheme", selection: $colorScheme) {
//               Text("Light").tag(0)
//               Text("Dark").tag(1)
//           }.pickerStyle(InlinePickerStyle())
        }
    }
}

