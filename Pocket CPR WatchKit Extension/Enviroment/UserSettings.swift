//
//  UserSettings.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/30/22.
//

import Foundation
import SwiftUI

class UserSettings: ObservableObject {
    @Published var vibration: Bool
    @Published var showSettingsWarning: Bool
    @Published var color: Color
    @Published var breathsColor: Color
    @Published var compressionRate: Float

    init(vibration: Bool, color: Color, compressionRate: Float, breathsColor: Color, showSettingsWarning: Bool) {
        self.vibration = vibration
        self.color = color
        self.compressionRate = compressionRate
        self.breathsColor = breathsColor
        self.showSettingsWarning = showSettingsWarning
    }
}
