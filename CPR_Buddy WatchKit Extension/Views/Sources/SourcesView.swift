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
                Text("Sources").bold().font(.system(size: 20)).foregroundColor(.purple)
                VStack {
                    Text("1. CPR Steps").bold().font(SizeResponsive().getSubtextFont())
                    Text("American Red Cross Organization").font(SizeResponsive().getSourcesFont())
                    Link("https://www.redcross.org/take-a-class/cpr/performing-cpr/cpr-steps", destination: URL(string: "https://www.redcross.org/take-a-class/cpr/performing-cpr/cpr-steps")!).font(SizeResponsive().getSourcesFont())
                }
                
                VStack {
                    Text("2. Child & Baby CPR").bold().font(SizeResponsive().getSubtextFont())
                    Text("American Red Cross Organization").font(SizeResponsive().getSourcesFont())
                    Link("https://www.redcross.org/take-a-class/cpr/performing-cpr/child-baby-cpr", destination: URL(string: "https://www.redcross.org/take-a-class/cpr/performing-cpr/child-baby-cpr")!).font(SizeResponsive().getSourcesFont())
                }
                
                VStack {
                    Text("3. Hands-Only CPR").bold().font(SizeResponsive().getSubtextFont())
                    Text("Tarrant County College").font(SizeResponsive().getSourcesFont())
                    Link("https://www.tccd.edu/about/emergency-information/know-what-to-do/medical-emergencies/cpr/#:~:text=Give%20compressions%20by%20using%202,cause%20the%20chest%20to%20rise.", destination: URL(string: "https://www.tccd.edu/about/emergency-information/know-what-to-do/medical-emergencies/cpr/#:~:text=Give%20compressions%20by%20using%202,cause%20the%20chest%20to%20rise.")!).font(SizeResponsive().getSourcesFont())
                }
                
                VStack {
                    Text("4. What is CPR?").bold().font(SizeResponsive().getSubtextFont())
                    Text("American Heart Association").font(SizeResponsive().getSourcesFont())
                    Link("https://cpr.heart.org/en/resources/what-is-cpr", destination: URL(string: "https://cpr.heart.org/en/resources/what-is-cpr")!).font(SizeResponsive().getSourcesFont())
                }
                
            }
        }
    }
}



