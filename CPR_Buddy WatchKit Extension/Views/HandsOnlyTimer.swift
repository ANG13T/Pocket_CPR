//
//  HandsOnlyTimer.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/16/22.
//

import SwiftUI

struct HandsOnlyTimerView: View {
    @Binding var isPresented: Bool
    @State private var chosenProfile: String = "Adult"
    @State private var cycles: Int = 5
    @State private var loop: Bool = false
    @State private var selection: Tab = .tabOne
       enum Tab {
           case tabOne
           case tabTwo
           case tabThree
       }
    @State private var wave: Bool = false
    @State private var wave1: Bool = false
     
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
                    
                    Picker(selection: self.$cycles, label: Text("Set Timer Cycles")) {
                        ForEach((1...20), id: \.self) {
                            Text("\($0)").tag($0).font(.title2)
                        }
                    }.frame(height: 70).padding(.top, 40).padding(.bottom, 5)
                    
                    Button("Start Cycles") {
                        selection = Tab.tabThree
                        loop = false
                    }.buttonStyle(BorderedButtonStyle(tint: .orange)).padding(.bottom, 5)
                    
                    Button("Loop Timer") {
                        selection = Tab.tabThree
                        loop = true
                    }.buttonStyle(BorderedButtonStyle(tint: .pink))
                
                }
                .opacity(0.8)

            }.gesture(DragGesture()).tag(Tab.tabTwo)
            
            
            VStack {
                ZStack {
                    Circle().stroke(lineWidth: 40).frame(width: 100, height: 100).foregroundColor(.blue).scaleEffect(wave ? 2 : 1).opacity(wave ? 0 : 1).animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false).speed(0.5)).onAppear() {
                        self.wave.toggle()
                    }
                    Circle().stroke(lineWidth: 40).frame(width: 100, height: 100).foregroundColor(.blue).scaleEffect(wave1 ? 2 : 1).opacity(wave1 ? 0 : 1).animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false).speed(0.7)).onAppear() {
                        self.wave1.toggle()
                    }
                    Circle().frame(width: 100, height: 100).foregroundColor(.blue).shadow(radius: 25)
                    Image(systemName: "plus.circle.fill").font(.system(size: 90)).foregroundColor(.white).shadow(radius: 25)
                }
            }.gesture(DragGesture()).tag(Tab.tabThree)
            
            

        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
