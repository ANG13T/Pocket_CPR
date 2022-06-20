//
//  HandsOnlyTimer.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/16/22.
//

import SwiftUI
extension Picker {
    func focusBorderHidden() -> some View {
        let isWatchOS7: Bool = {
            if #available(watchOS 7, *) {
                return true
            }

            return false
        }()

        let padding: EdgeInsets = {
            if isWatchOS7 {
                return .init(top: 17, leading: 0, bottom: 0, trailing: 0)
            }

            return .init(top: 8.5, leading: 0.5, bottom: 8.5, trailing: 0.5)
        }()

        return self
            .overlay(
                RoundedRectangle(cornerRadius: isWatchOS7 ? 8 : 7)
                    .stroke(Color.black, lineWidth: isWatchOS7 ? 4 : 3.5)
                    .offset(y: isWatchOS7 ? 0 : 8)
                    .padding(padding)
            )
    }
}

struct HandsOnlyTimerView: View {
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
                    
                    Picker(selection: self.$cycles, label: Text("Set Timer Cycles")) {
                        ForEach((1...20), id: \.self) {
                            Text("\($0)").tag($0).font(.title2)
                        }
                    }.focusBorderHidden().frame(height: 70).padding(.top, 40).padding(.bottom, 5)
                    
                    Button("Start Cycles") {
                        isPresented.toggle()
                    }.buttonStyle(BorderedButtonStyle(tint: .orange)).padding(.bottom, 5)
                    
                    Button("Loop Timer") {
                        isPresented.toggle()
                    }.buttonStyle(BorderedButtonStyle(tint: .pink))
                
                }
                .opacity(0.8)

            }.gesture(DragGesture()).tag(Tab.tabTwo)
            
            
            

        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
