//
//  SizeResponsive.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/30/22.
//

import Foundation
import SwiftUI

enum WatchResolution {
    case Watch38mm, Watch40mm, Watch41mm, Watch42mm, Watch44mm, Unknown
}

extension WKInterfaceDevice {
class func currentResolution() -> WatchResolution {
    let watch38mmRect = CGRect(x: 0, y: 0, width: 136, height: 170)
    let watch40mmRect = CGRect(x: 0, y: 0, width: 162, height: 197)
    let watch41mmRect = CGRect(x: 0, y: 0, width: 176, height: 215)
    let watch42mmRect = CGRect(x: 0, y: 0, width: 156, height: 195)
    let watch44mmRect = CGRect(x: 0, y: 0, width: 184, height: 224)

    let currentBounds = WKInterfaceDevice.current().screenBounds

    switch currentBounds {
    case watch38mmRect:
        return .Watch38mm
    case watch40mmRect:
        return .Watch40mm
    case watch41mmRect:
        return .Watch41mm
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
            return .system(size: 11)
        case .Watch40mm :
            return .system(size: 11)
        case .Watch41mm:
            return .system(size: 11)
        case .Watch42mm:
            return .system(size: 12)
        case .Watch44mm:
            return .system(size: 12)
        default:
            return .footnote
        }
    }
    
    func getSourcesFont() -> Font {
        switch resol {
        case .Watch38mm:
            return .system(size: 8)
        case .Watch40mm :
            return .system(size: 8)
        case .Watch41mm:
            return .system(size: 8)
        case .Watch42mm:
            return .system(size: 8)
        case .Watch44mm:
            return .system(size: 8)
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
            return .system(size: 11)
        case .Watch40mm :
            return .system(size: 11)
        case .Watch41mm:
            return .system(size: 11)
        case .Watch42mm:
            return .system(size: 12)
        case .Watch44mm:
            return .system(size: 12)
        default:
            return .system(size: 13)
        }
    }
    
    func getTimerSetTimerCyclesFont() -> Font {
        switch resol {
        case .Watch38mm:
            return .system(size: 11)
        case .Watch40mm :
            return .system(size: 11)
        case .Watch42mm:
            return .system(size: 11)
        case .Watch44mm:
            return .system(size: 12)
        default:
            return .system(size: 13)
        }
    }
    
    //    Timer Sizes
    
    func getTimerTopButtonPaddingLoop() -> CGFloat {
        switch resol {
        case .Watch38mm:
            return 30
        case .Watch40mm :
            return 30
        case .Watch41mm:
            return 55
        case .Watch42mm:
            return 30
        case .Watch44mm:
            return 60
        default:
            return 70
        }
    }
    
    func getTimerTopButtonPaddingNotLoop() -> CGFloat {
        switch resol {
        case .Watch38mm:
            return 30
        case .Watch40mm :
            return 35
        case .Watch41mm:
            return 35
        case .Watch42mm:
            return 35
        case .Watch44mm:
            return 45
        default:
            return 60
        }
    }
    
    func getTimerBottomButtonPaddingLoop() -> CGFloat {
        switch resol {
        case .Watch38mm:
            return 30
        case .Watch40mm :
            return 30
        case .Watch41mm:
            return 25
        case .Watch42mm:
            return 30
        case .Watch44mm:
            return 35
        default:
            return 45
        }
    }
    
    func getTimerCircleSize() -> CGFloat {
        switch resol {
        case .Watch38mm:
            return 70
        case .Watch40mm :
            return 70
        case .Watch41mm :
            return 75
        case .Watch42mm:
            return 80
        case .Watch44mm:
            return 80
        default:
            return 80
        }
    }
    
    func getTimerProgressRingSize() -> CGFloat {
        switch resol {
        case .Watch38mm:
            return 90
        case .Watch40mm :
            return 110
        case .Watch41mm :
            return 110
        case .Watch42mm:
            return 110
        case .Watch44mm:
            return 120
        default:
            return 120
        }
    }
    
    func getTimerFontSize() -> CGFloat {
        switch resol {
        case .Watch38mm:
            return 15
        case .Watch40mm :
            return 17
        case .Watch42mm:
            return 17
        case .Watch44mm:
            return 20
        default:
            return 20
        }
    }
    
    func getTimerBottomButtonPaddingNotLoop() -> CGFloat {
        switch resol {
        case .Watch38mm:
            return 10
        case .Watch40mm :
            return 10
        case .Watch41mm:
            return 10
        case .Watch42mm:
            return 10
        case .Watch44mm:
            return 15
        default:
            return 20
        }
    }
    
    init(){
        resol = WKInterfaceDevice.currentResolution()
    }
}
