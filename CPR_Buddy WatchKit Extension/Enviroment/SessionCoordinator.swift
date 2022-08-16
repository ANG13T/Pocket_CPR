//
//  SessionCoordinator.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 8/16/22.
//

import Foundation

class SessionCoordinator {
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
}
