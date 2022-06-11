//
//  AboutView.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/11/22.
//

import SwiftUI

struct AboutView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "headphones")
                .font(.system(size: 30))

            Text("To play audio, connect Bluetooth headphones to your Apple Watch.")
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
        .opacity(0.8)
        .padding(10)

        Spacer()

        Button("Connect a Device") {
            isPresented.toggle()
        }.padding(.horizontal)
    }
}

