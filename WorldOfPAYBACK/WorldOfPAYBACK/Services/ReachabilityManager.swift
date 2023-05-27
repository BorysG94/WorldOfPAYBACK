//
//  Reachability.swift
//  WorldOfPAYBACK
//
//  Created by Ola Adamus on 26/05/2023.
//

import Foundation
import SwiftUI
import Reachability

class ReachabilityManager: ObservableObject {
    @Published var isOffline = false
    private let reachability = try! Reachability()

    init() {
        startMonitoringReachability()
    }

    deinit {
        stopMonitoringReachability()
    }

    private func startMonitoringReachability() {
        reachability.whenReachable = { _ in
            DispatchQueue.main.async {
                self.isOffline = false
            }
        }
        reachability.whenUnreachable = { _ in
            DispatchQueue.main.async {
                self.isOffline = true
            }
        }
        do {
            try reachability.startNotifier()
        } catch {
            print("Error starting reachability notifier: \(error)")
        }
    }

    private func stopMonitoringReachability() {
        reachability.stopNotifier()
    }
}

