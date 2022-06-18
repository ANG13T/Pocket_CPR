//
//  TraditionalTimer.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/15/22.
//

import SwiftUI

struct TraditionalTimerView: View {
    @Binding var isPresented: Bool
    @State private var chosenProfile: String = "Adult"
    @State private var cycles: Int = 5
    @State private var loop: Bool = false
    @State private var selection: Tab = .tabOne
       enum Tab {
           case tabOne
           case tabTwo
       }
     
    var body: some View {
        TabView(selection: $selection) {
            // PAGE 1
            VStack {
                VStack {
                    Button("Infant") {
                        chosenProfile = "Infant"
                        selection = Tab.tabTwo
                    }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .blue)).padding(.top, 5)
                    
                    Button("Child") {
                        chosenProfile = "Child"
                        selection = Tab.tabTwo
                    }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                    
                    Button("Adult") {
                        chosenProfile = "Adult"
                        selection = Tab.tabTwo
                    }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .orange)).padding(.top, 5)
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }.gesture(DragGesture()).padding(.top, 15).tag(Tab.tabOne)

            VStack {
                VStack {
                    Text("Set Timer Cycles")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                    
                    Picker(selection: self.$cycles, label: Text("")) {
                        ForEach((1...20), id: \.self) {
                            Text("\($0)").tag($0).font(.title2)
                        }
                    }
                    
                }
                .opacity(0.8)
                .padding(10)

                Spacer()
            }.gesture(DragGesture()).padding(.top, 15).tag(Tab.tabTwo)
            
            
            

        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
