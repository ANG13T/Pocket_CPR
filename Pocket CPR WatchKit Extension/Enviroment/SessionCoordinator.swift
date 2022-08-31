//
//  SessionCoordinator.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 8/16/22.
//

import SwiftUI

class SessionCoordinator : ObservableObject{
    private var session: WKExtendedRuntimeSession?

    func start() {
        guard session?.state != .running else { return }

        // create or recreate session if needed
        if nil == session || session?.state == .invalid {
            session = WKExtendedRuntimeSession()
        }
        session?.start()
    }

    func invalidate() {
        session?.invalidate()
    }
    
    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
           print("Session stopped: \(Date())")
       }
       func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
           print("Session started: \(Date())")
       }
       func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
           print("Session expired: \(Date())")
       }
}
