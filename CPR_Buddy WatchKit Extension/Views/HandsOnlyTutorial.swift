//
//  HandsOnlyTutorial.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/16/22.
//

import SwiftUI

struct HandsOnlyTutorialView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        TabView {
            // PAGE 1
            VStack {
                VStack {
                    Text("**Observe your Surroundings**")
                    .font(.footnote)
                    .multilineTextAlignment(.center)

                    Text("Check your surroundings and person. Ensure you are in a safe area, tap on the person's shoulder to see if they are OK, and check for signs of normal breathing.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                }
                .opacity(0.8)
                .padding(2)

                Spacer()
            }.padding(.top, 15)

            VStack {
                VStack {
                    Text("**Call 911**")
                    Image(systemName: "phone.fill")
                        .font(.system(size: 30)).padding(.top, 10)
                    Text("If you observe signs of irregular breathing or if there is no response from the person, call 911 for help.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                }
                .opacity(0.8)
                .padding(2)

                Spacer()
            }
            
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
                    Text("**Hands-Only CPR**")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    
                    Text("People who have little or no CPR training should use hands-only CPR. It requires you to compress the victim's chest hard for about 100-120 compressions a minute until help arrives.")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                }
                .opacity(0.8)
                .padding(5)
            }
            
            VStack {
                VStack {
                    
                    Text("**Traditional CPR**")
                    .font(.footnote)
                    .multilineTextAlignment(.center)

                    Text("Traditional CPR is meant for people who have former CPR training. It requires you to perform two rescue breaths for every 30 chest compressions until help arrives.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
                .opacity(0.8)
                .padding(5)
            }
            
            VStack {
                VStack {
                    Text("**About CPR Buddy**")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    
                    Text("CPR Buddy teaches both Hands-Only and Traditional CPR methods through tutorials and CPR timers.")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                }
                .opacity(0.8)

                Spacer()
                Button("Get Started") {
                    isPresented.toggle()
                }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .orange)).padding(.top, 5)
            }.padding(.top, 10)

        }.tabViewStyle(PageTabViewStyle())
    }
}


