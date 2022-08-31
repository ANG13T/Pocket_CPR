//
//  TraditionalSettingsWarningView.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 8/30/22.
//

import SwiftUI

struct TraditionalSettingsWarningView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("**Settings Tip**")
            .font(.headline)
            .multilineTextAlignment(.center)
            .padding(.vertical, 5)
            Text("For best performance, go to **Settings > Display & Brightness > Wake Duration > 70 seconds**").font(SizeResponsive().getSubtextFont())
                .multilineTextAlignment(.center)
                .padding(.top, 10)
        }
    }
    
}
