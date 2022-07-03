//
//  SourcesView.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 7/3/22.
//


import SwiftUI

struct SourcesView: View {
    @EnvironmentObject private var userSettings: UserSettings
    @Binding var isPresented: Bool
    @State var presentColorPicker: Bool = false
    @State var presentBreathsColorPicker: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("Sources").bold().font(.system(size: 20))
                Text("All information on this app was retrieved from the following sources").font(.system(size: 10))
                VStack {
                    Text("1. CPR Steps").bold()
                    Text("American Red Cross Organization").bold()
                    Text("https://www.redcross.org/take-a-class/cpr/performing-cpr/cpr-steps")
                }
                
                VStack {
                    Text("2. Child & Baby CPR").bold()
                    Text("American Red Cross Organization").bold()
                    Text("https://www.redcross.org/take-a-class/cpr/performing-cpr/child-baby-cpr")
                }
                
                VStack {
                    Text("3. Hands-Only CPR").bold()
                    Text("Tarrant County College").bold()
                    Text("https://www.tccd.edu/about/emergency-information/know-what-to-do/medical-emergencies/cpr/#:~:text=Give%20compressions%20by%20using%202,cause%20the%20chest%20to%20rise.")
                }
                
                VStack {
                    Text("4. What is CPR?").bold()
                    Text("American Heart Association").bold()
                    Text("https://cpr.heart.org/en/resources/what-is-cpr")
                }
                
                VStack {
                    Text("1. ").bold()
                    Text("")
                }
                
            }
        }
    }
}



