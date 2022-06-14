//
//  HandsOnlyView.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/11/22.
//

import SwiftUI

struct HandsOnlyView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("**Hands-Only CPR**")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
                
                Button("Start Timer") {
                    isPresented.toggle()
                }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .blue)).padding(.top, 5)
                .padding(.bottom, 5)
                
                Button("Tutorial") {
                    isPresented.toggle()
                }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                
            }
            .opacity(0.8)
            .padding(1)
        }

        Spacer()
        
    }
}

