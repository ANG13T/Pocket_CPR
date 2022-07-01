//
//  SizeResponsive.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/30/22.
//

import Foundation
import SwiftUI

enum WatchResolution {
    case Watch38mm, Watch40mm,Watch42mm,Watch44mm, Unknown
}

extension WKInterfaceDevice {
class func currentResolution() -> WatchResolution {
    let watch38mmRect = CGRect(x: 0, y: 0, width: 136, height: 170)
    let watch40mmRect = CGRect(x: 0, y: 0, width: 162, height: 197)
    let watch42mmRect = CGRect(x: 0, y: 0, width: 156, height: 195)
    let watch44mmRect = CGRect(x: 0, y: 0, width: 184, height: 224)

    let currentBounds = WKInterfaceDevice.current().screenBounds

    switch currentBounds {
    case watch38mmRect:
        return .Watch38mm
    case watch40mmRect:
        return .Watch40mm
    case watch42mmRect:
        return .Watch42mm
    case watch44mmRect:
        return .Watch44mm
    default:
        return .Unknown
    }
  }
}

class SizeResponsive {
    let resol : WatchResolution
    
    func getSubtextFont() -> Font {
        switch resol {
        case .Watch38mm:
            // Do Something
            return .system(size: 11)
        case .Watch40mm :
            return .system(size: 11)
        case .Watch42mm:
            return .system(size: 12)
            // Do Something
        case .Watch44mm:
            return .footnote
        default:
            return .footnote
        }
    }
    
    func getTimerCyclePickerHeight() -> CGFloat {
        switch resol {
        case .Watch38mm:
            return 60
        case .Watch40mm :
            return 60
        case .Watch42mm:
            return 60
        case .Watch44mm:
            return 70
        default:
            return 70
        }
    }

    
    func getTimerCyclePickerPadding() -> CGFloat {
        switch resol {
        case .Watch38mm:
            return 20
        case .Watch40mm :
            return 20
        case .Watch42mm:
            return 20
        case .Watch44mm:
            return 40
        default:
            return 40
        }
    }
    
    
    func getSettingsCompressionRateFont() -> Font {
        switch resol {
        case .Watch38mm:
            // Do Something
            return .system(size: 11)
        case .Watch40mm :
            return .system(size: 11)
        case .Watch42mm:
            return .system(size: 12)
            // Do Something
        case .Watch44mm:
            return .system(size: 13)
        default:
            return .system(size: 13)
        }
    }
    
    init(){
        resol = WKInterfaceDevice.currentResolution()
    }
}