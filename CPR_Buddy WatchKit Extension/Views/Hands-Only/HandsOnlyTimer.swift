//
//  HandsOnlyTimer.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/16/22.
//

import SwiftUI

struct HandsOnlyTimerView: View {
    let coordinator = SessionCoordinator()
    @Binding var isPresented: Bool
    @EnvironmentObject private var userSettings: UserSettings
    @State private var chosenProfile: String = "Adult"
    @State private var cycles = 5
    @State private var pauseStatus : Bool = false
    @State private var timeInterval = 0.6
    @State private var initialCycles = 5
    @State private var loop: Bool = false
    @State private var selection: Tab = .tabOne
    @State var circleProgress: CGFloat = 0.0
    @Binding public var clickTimer: Timer?
    @Binding public var progressTimer: Timer?
    @State public var count = 0
    
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
                    Text("**Timer Complete!**")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                    Image(systemName: "clock.badge.checkmark")
                        .font(.system(size: 50)).padding([.top, .bottom], 10)
                    
                    Button(action: {
                        isPresented = false
                        pauseStatus = false
                        progressTimer?.invalidate()
                        coordinator.invalidate()
                        clickTimer?.invalidate()
                    }, label: {
                        Text("Close")
                    }).buttonStyle(BorderedButtonStyle(tint: .blue))
                }
            )
    }
    
    private var loopTimerView: some View {
        Circle()
            .trim(from: 0.0, to: circleProgress)
            .stroke(userSettings.color, lineWidth: 10)
            .frame(width: SizeResponsive().getTimerProgressRingSize(), height: SizeResponsive().getTimerProgressRingSize())
            .rotationEffect(Angle(degrees: -90))
    }
    
    private var buttonDisplayView: some View {
        HStack(spacing: 20) {
            Button(action: {
                isPresented = false
                pauseStatus = false
                progressTimer?.invalidate()
                coordinator.invalidate()
                clickTimer?.invalidate()
            }) {
                ZStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 30, height: 30)
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                
            }.buttonStyle(PlainButtonStyle())
            
            cycleDisplayView
            
            Button(action: {
                pauseStatus.toggle()
            }) {
                ZStack {
                    Circle()
                        .foregroundColor(userSettings.color)
                        .frame(width: 30, height: 30)
                    Image(systemName: pauseStatus ? "play.fill" : "pause.fill")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                
            }.buttonStyle(PlainButtonStyle())
        }
    }
    
    private var cycleDisplayView: some View {
        var cycleCount = (initialCycles + 1) - cycles
        if loop {
            cycleCount = cycles
        }
        
        return Text("**Cycle \(cycleCount)**").font(.system(size: SizeResponsive().getTimerFontSize())).foregroundColor(.white)
    }
    
    var body: some View {
        
        if cycles == 0 {
            completedTimer
        }
        
        TabView(selection: $selection) {
            
            VStack {
                VStack {
                    
                    Picker(selection: self.$initialCycles, label: Text("Set Timer Cycles").font(SizeResponsive().getTimerSetTimerCyclesFont()).bold()) {
                        ForEach((1...20), id: \.self) {
                            Text("\($0)").tag($0).font(.title2)
                        }
                    }.frame(height: SizeResponsive().getTimerCyclePickerHeight()).padding(.top, SizeResponsive().getTimerCyclePickerPadding()).padding(.bottom, 5)
                    
                    Button("Start Cycles") {
                        selection = Tab.tabTwo
                        cycles = initialCycles
                        timeInterval = Double(60 / userSettings.compressionRate)
                        startTimer()
                        loop = false
                        count = Int(userSettings.compressionRate)
                        clickTimer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) {time in
                            if !pauseStatus {
                                if (isPresented && userSettings.vibration) {
                                    WKInterfaceDevice.current().play(.click)
                                }
                                
                                if count <= 1 {
                                    cycles -= 1
                                }
                                
                                if count > 1 {
                                    count -= 1
                                }else if count <= 1 && cycles > 0{
                                    count = Int(userSettings.compressionRate)
                                }else {
                                    if (userSettings.vibration) {
                                        WKInterfaceDevice.current().play(.success)
                                    }
                                    clickTimer?.invalidate()
                                }
                            }
                        }
                        
                    }.buttonStyle(BorderedButtonStyle(tint: .orange)).padding(.bottom, 5)
                    
                    Button("Loop Timer") {
                        selection = Tab.tabTwo
                        loop = true
                        timeInterval = Double(60 / userSettings.compressionRate)
                        count = Int(userSettings.compressionRate)
                        cycles = 1
                        clickTimer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) {time in
                            
                            if !pauseStatus {
                                if (isPresented && userSettings.vibration) {
                                    WKInterfaceDevice.current().play(.click)
                                }
                                
                                if count > 1 {
                                    count -= 1
                                }else {
                                    count = Int(userSettings.compressionRate)
                                    cycles += 1
                                }
                            }
                        }
                    }.buttonStyle(BorderedButtonStyle(tint: .pink))
                    
                }
                .opacity(0.8)
                
            }.gesture(DragGesture()).tag(Tab.tabOne)
            
            
            VStack {
                Spacer().frame(height: loop ? SizeResponsive().getTimerTopButtonPaddingLoop() : SizeResponsive().getTimerTopButtonPaddingNotLoop())
                ZStack {
                    Circle().stroke(lineWidth: 20).frame(width: SizeResponsive().getTimerCircleSize() - 20, height: SizeResponsive().getTimerCircleSize() - 20).foregroundColor(userSettings.color).scaleEffect(wave ? 2 : 1).opacity(wave ? 0 : 1).animation(pauseStatus ? nil : Animation.easeInOut(duration: timeInterval).repeatForever(autoreverses: false).speed(1)).onAppear(
                    ) {
                        self.wave.toggle()
                    }
                    Circle().frame(width: SizeResponsive().getTimerCircleSize(), height: SizeResponsive().getTimerCircleSize()).foregroundColor(userSettings.color).shadow(radius: 25)
                    if !loop {
                        loopTimerView
                    }
                    Text("\(count)").font(.system(size: 40)).foregroundColor(.white).shadow(radius: 25)
                }
                Spacer().frame(height: loop ? SizeResponsive().getTimerBottomButtonPaddingLoop() : SizeResponsive().getTimerBottomButtonPaddingNotLoop())
                buttonDisplayView
            }.gesture(DragGesture()).tag(Tab.tabTwo)
            
            
            
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    func startTimer() {
        coordinator.start()
        progressTimer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            withAnimation() {
                if !pauseStatus {
                    let cycleTime = CGFloat(Int(userSettings.compressionRate) * initialCycles)
                    self.circleProgress += (1 / cycleTime)
                    if self.circleProgress >= 1.0 {
                        timer.invalidate()
                        coordinator.invalidate()
                    }
                }
                
            }
        }
    }
}
