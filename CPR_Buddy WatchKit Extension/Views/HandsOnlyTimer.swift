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
    @State private var timer: Timer?
    @State private var count = 0
    
       enum Tab {
           case tabOne
           case tabTwo
       }
    @State private var wave: Bool = false
    @State private var wave1: Bool = false
     
    var body: some View {
        TabView(selection: $selection) {

            VStack {
                VStack {
                    
                    Picker(selection: self.$cycles, label: Text("Set Timer Cycles")) {
                        ForEach((1...20), id: \.self) {
                            Text("\($0)").tag($0).font(.title2)
                        }
                    }.frame(height: 70).padding(.top, 40).padding(.bottom, 5)
                    
                    Button("Start Cycles") {
                        selection = Tab.tabTwo
                        loop = false
                        count = 60
                        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) {time in
                            if count > 0 {
                                count -= 1
                            }else if count <= 0 && cycles > 0{
                                cycles -= 1
                                count = 60
                            }else {
                                timer?.invalidate()
                            }
                        }

                    }.buttonStyle(BorderedButtonStyle(tint: .orange)).padding(.bottom, 5)
                    
                    Button("Loop Timer") {
                        selection = Tab.tabTwo
                        loop = true
                    }.buttonStyle(BorderedButtonStyle(tint: .pink))
                
                }
                .opacity(0.8)

            }.gesture(DragGesture()).tag(Tab.tabOne)
            
            
            VStack {
                ZStack {
                    Circle().stroke(lineWidth: 20).frame(width: 80, height: 80).foregroundColor(.blue).scaleEffect(wave ? 2 : 1).opacity(wave ? 0 : 1).animation(Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: false).speed(0.8)).onAppear() {
                        self.wave.toggle()
                    }
                    Circle().frame(width: 80, height: 80).foregroundColor(.blue).shadow(radius: 25)
                    Text("\(count)").font(.system(size: 40)).foregroundColor(.white).shadow(radius: 25)
                }
            }.gesture(DragGesture()).tag(Tab.tabTwo)
            
            

        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
