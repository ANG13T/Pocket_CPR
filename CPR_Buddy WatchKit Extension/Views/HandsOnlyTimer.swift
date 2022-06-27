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
    @State private var cycles = 5
    @State private var timeInterval = 0.6
    @State private var initialCycles = 5
    @State private var loop: Bool = false
    @State private var selection: Tab = .tabOne
    @State var circleProgress: CGFloat = 0.0
    @State private var timer: Timer?
    @State private var count = 0
    
       enum Tab {
           case tabOne
           case tabTwo
       }
    @State private var wave: Bool = false
    @State private var wave1: Bool = false
    
    private var completedTimer: some View {
        RoundedRectangle(cornerRadius: 10)
        .fill(Color.black.opacity(0.7))
        .frame(width: WKInterfaceDevice.current().screenBounds.width, height: WKInterfaceDevice.current().screenBounds.height)
        .overlay(
            VStack {
                Text("Timer Complete!").font(.system(size: 40))
                Image(systemName: "checkmark")
                    .font(.system(size: 30)).padding([.top, .bottom], 20)
                
                Button(action: {
                    isPresented = false
                }, label: {
                    Text("Close").bold()
                }).background(RoundedRectangle(cornerRadius: 20).fill(.orange))
            }
        )
    }
    
    private var loopTimerView: some View {
        Circle()
            .trim(from: 0.0, to: circleProgress)
            .stroke(Color.blue, lineWidth: 10)
            .frame(width: 120, height: 120)
            .rotationEffect(Angle(degrees: -90))
    }
    
    private var cycleDisplayView: some View {
        Text("**Cycle \((initialCycles + 1) - cycles)**").font(.system(size: 20)).foregroundColor(.white).padding(.top, 10)
    }
     
    var body: some View {
        
        if cycles == 0 {
            completedTimer
        }
        
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
                        cycles = initialCycles
                        startTimer()
                        loop = false
                        count = 60
                        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) {time in
                            if (isPresented) {
                                WKInterfaceDevice.current().play(.click)
                            }
                            
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
                        count = 60
                        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) {time in
                            if (isPresented) {
                                WKInterfaceDevice.current().play(.click)
                            }
                            
                            if count > 0 {
                                count -= 1
                            }else {
                                count = 60
                                cycles += 1
                            }
                        }
                    }.buttonStyle(BorderedButtonStyle(tint: .pink))
                
                }
                .opacity(0.8)

            }.gesture(DragGesture()).tag(Tab.tabOne)
            
            
            VStack {
                Spacer().frame(height: 40)
                ZStack {
                    Circle().stroke(lineWidth: 20).frame(width: 60, height: 60).foregroundColor(.blue).scaleEffect(wave ? 2 : 1).opacity(wave ? 0 : 1).animation(Animation.easeInOut(duration: timeInterval).repeatForever(autoreverses: false).speed(1)).onAppear() {
                        self.wave.toggle()
                    }
                    Circle().frame(width: 80, height: 80).foregroundColor(.blue).shadow(radius: 25)
                    if !loop {
                        loopTimerView
                    }
                    Text("\(count)").font(.system(size: 40)).foregroundColor(.white).shadow(radius: 25).padding(.top, 30)
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Text("Finish Timer").bold()
                    }).background(RoundedRectangle(cornerRadius: 20).fill(.orange))
                }
                cycleDisplayView
            }.gesture(DragGesture()).tag(Tab.tabTwo)
            
            

        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    func startTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            withAnimation() {
                let cycleTime = CGFloat(60 * initialCycles)
                self.circleProgress += (1 / cycleTime)
                if self.circleProgress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}


