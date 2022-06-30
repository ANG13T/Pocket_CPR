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
    @State var vibrationStatus: Bool = true
    @State private var compressionRate = 100.0
    @State private var colorScheme = 1
    @State private var selectedColor : Color = .blue
    
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
                    .foregroundColor(.blue).font(.system(size: 13)).padding(.top, 5)
                
                
                HStack {
                    Text("Pulse Color")
                    
                    //                            Spacer().frame(width: 40)
                    Spacer()
                    
                    Image(systemName: "circle.fill").foregroundColor(selectedColor)
                }
                .foregroundColor(Color.white)
                Toggle(isOn: $vibrationStatus) {
                    Text("Vibrations")
                }
                
                //            Text("Vibrations")
            }
        }
    }
}


//    .fullScreenCover(isPresented: $presentColorPicker) {
//        TraditionalTutorialView(isPresented: $presentColorPicker).toolbar {
//
//            ToolbarItem(placement: .cancellationAction) {
//
//                Button(action: {
//                    presentColorPicker.toggle()
//                }) {
//                    Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
//                }
//
//            }
//
//        }
//    }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
