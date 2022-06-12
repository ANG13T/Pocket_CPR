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
            
            VStack {
                VStack {

                    Text("In an average person's body, under standard conditions, the heart's resting heart rate is between 60 - 100 beats per minute.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }.padding(.top, 25)
            
            VStack {
                VStack {

                    Text("When a person's heart stops beating, CPR can help regulate blood flow around the body. There are two forms of CPR: \n **1) Hands-Only CPR** \n\n **2) Traditional CPR**")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }.padding(.top, 15)
            
            VStack {
                VStack {
                    Text("**Hands-Only CPR**")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    
                    Text("")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }.padding(.top, 15)
            
            VStack {
                VStack {
                    
                    Text("**Traditional CPR**")
                    .font(.footnote)
                    .multilineTextAlignment(.center)

                    Text("When a person's heart stops beating, CPR can help regulate blood flow around the body. There are two forms of CPR: \n **1) Hands-Only CPR** \n **2) Traditional CPR**")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }.padding(.top, 15)
            
            VStack {
                VStack {
                    Text("**About PocketCPR**")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    
                    Text("")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }.padding(.top, 15)

        }.foregroundColor(Color.white)
        .background(Color.yellow)
        .tabViewStyle(PageTabViewStyle())
    }
}

