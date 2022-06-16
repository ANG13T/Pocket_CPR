//
//  TraditionalTimer.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/15/22.
//

import SwiftUI

struct TraditionalTimerView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        TabView {
            // PAGE 1
            VStack {
                VStack {
                    Image(systemName: "heart")
                        .font(.system(size: 30))

                    Text("CPR is a life saving procedure performed on people whose heart stops beating.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }.padding(.top, 15)

            VStack {
                VStack {
                    Image(systemName: "heart")
                        .font(.system(size: 30))
                    Text("CPR can double or triple the victim's survival rate. With enough guidance, anyone can learn CPR.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }.padding(.top, 15)
            
            
            

        }.tabViewStyle(PageTabViewStyle())
    }
}
