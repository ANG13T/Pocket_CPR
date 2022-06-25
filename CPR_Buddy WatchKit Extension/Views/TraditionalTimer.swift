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
    @State private var compressions: Bool = true
    @State private var selection: Tab = .tabOne
    @State private var timeInterval = 0.6
    @State private var timer: Timer?
    @State var circleProgress: CGFloat = 0.0
    @State private var initialCycles = 5
    @State private var count = 0
    @State private var wave: Bool = false
    @State private var wave1: Bool = false
    
       enum Tab {
           case tabOne
           case tabTwo
       }
     
    var body: some View {
        TabView(selection: $selection) {
            
            VStack {
                VStack {
                    
                    Picker(selection: self.$initialCycles, label: Text("Set Timer Cycles")) {
                        ForEach((1...20), id: \.self) {
                            Text("\($0)").tag($0).font(.title2)
                        }
                    }.frame(height: 70).padding(.top, 40).padding(.bottom, 5)
                    
                    Button("Start Cycles") {
                        selection = Tab.tabTwo
                        compressions = true
                        cycles = initialCycles
                        startTimer()
                        loop = false
                        count = 60
                        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) {time in
                            WKInterfaceDevice.current().play(.click)
                            if count > 0 {
                                count -= 1
                            }else if count <= 0 && cycles > 0 {
                                compressions = !compressions
                                cycles -= 1
                                count = 60
                                if (!compressions) {
                                    count = 10
                                }
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
                Spacer().frame(height: 40)
                ZStack {
                    Circle().stroke(lineWidth: 20).frame(width: 60, height: 60).foregroundColor(compressions ? Color.blue : Color.green).scaleEffect(wave ? 2 : 1).opacity(wave ? 0 : 1).animation(Animation.easeInOut(duration: timeInterval).repeatForever(autoreverses: false).speed(1)).onAppear() {
                        self.wave.toggle()
                    }
                    Circle().frame(width: 80, height: 80).foregroundColor(compressions ? Color.blue : Color.green).shadow(radius: 25)
                    Circle()
                        .trim(from: 0.0, to: circleProgress)
                        .stroke(compressions ? Color.blue : Color.green, lineWidth: 10)
                        .frame(width: 120, height: 120)
                        .rotationEffect(Angle(degrees: -90))
                    Text("\(count)").font(.system(size: 40)).foregroundColor(.white).shadow(radius: 25)
                }
                Text("**Cycle \((initialCycles + 1) - cycles)**").font(.system(size: 20)).foregroundColor(.white).padding(.top, 10)
                Text(compressions ? "Compressions" : "Breaths").font(.system(size: 10)).foregroundColor(.white)
            }.gesture(DragGesture()).tag(Tab.tabTwo)

            

        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    func startTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            withAnimation() {
                var pulseAmount = 60
                if(!compressions) {
                    pulseAmount = 10
                }
                let cycleTime = CGFloat(pulseAmount * initialCycles)
                self.circleProgress += (1 / cycleTime)
                if self.circleProgress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}
