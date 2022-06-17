//
//  HandsOnlyTutorial.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/16/22.
//

import SwiftUI

struct HandsOnlyTutorialView: View {
    @Binding var isPresented: Bool
    @State private var chosenProfile: String = "Adult"
    @State private var selection: Tab = .tabOne
    enum Tab {
        case tabOne
        case tabTwo
    }
    
    var body: some View {
        TabView(selection: $selection) {
            VStack {
                VStack {
                    Button("Infant") {
                        chosenProfile = "Infant"
                        selection = Tab.tabTwo
                    }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                    
                    Button("Child") {
                        chosenProfile = "Child"
                        selection = Tab.tabTwo
                    }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                    
                    Button("Adult") {
                        chosenProfile = "Adult"
                        selection = Tab.tabTwo
                    }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }.gesture(DragGesture()).padding(.top, 15)

            
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
            }.padding(.top, 15).tag(Tab.tabTwo)

            VStack {
                VStack {
                    Text("**Call 911**").font(.footnote)
                        .multilineTextAlignment(.center)
                    
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
                    Text("**Begin CPR**").font(.footnote)
                        .multilineTextAlignment(.center)
                
                    Text("Make sure the person's back is against a firm, flat surface. Kneel beside the person. Spread your knees about a shoulder width apart.")
                        .font(.footnote)
                        .multilineTextAlignment(.center).padding(.top, 10)
                }
                .opacity(0.8)
                .padding(10)

            }
            
            VStack {
                VStack {
                    Text("**Hand Placement**")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                   
                    Text("Place the heel of one hand in the center of their chest, with your other hand on top. Interlace your fingers and ensure they are above the chest.")
                        .font(.footnote)
                        .multilineTextAlignment(.center).padding(.top, 10)
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }
            
            VStack {
                VStack {
                    Text("**Body Position**")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    
                    Text("Position your body so that your shoulders are directly over your hands. Lock your elbows to keep your arms straight.")
                    .font(.footnote)
                    .multilineTextAlignment(.center).padding(.top, 10)
                }
                .opacity(0.8)
                .padding(5)
            }
            
            VStack {
                VStack {
                    
                    Text("**Compressions**")
                    .font(.footnote)
                    .multilineTextAlignment(.center)

                    Text("Push hard and fast (at least 2 inches; 100 to 120 compressions per minute). Allow chest to return to its normal position after each compression.")
                        .font(.footnote)
                        .multilineTextAlignment(.center).padding(.top, 10)
                }
                .opacity(0.8)
                .padding(5)
            }
        

        }.tabViewStyle(PageTabViewStyle())
    }
}


