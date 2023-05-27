////
////  ContentView.swift
////  WorldOfPAYBACK
////
////  Created by Ola Adamus on 24/05/2023.
////
//
//import Foundation
//import SwiftUI
//import Reachability
//
//struct ContentView: View {
//
//    @State private var isOffline = false
//    private let reachability = try! Reachability()
//    @StateObject var data = ReadData()
//    @StateObject var viewModel = TransactionListViewModel()
//
//
//    var body: some View {
//        VStack {
//            if isOffline {
//                ErrorView()
//            } else {
//                NavigationView {
//                    TransactionListView()
//                        .navigationTitle("Transactions")
//                }
//            }
//        }
//        .onAppear {
//            startMonitoringReachability()
//        }
//        .onDisappear {
//            stopMonitoringReachability()
//        }
//    }
//
//    private func startMonitoringReachability() {
//        reachability.whenReachable = { _ in
//            DispatchQueue.main.async {
//                            isOffline = false
//                        }
//
//        }
//        reachability.whenUnreachable = { _ in
//            DispatchQueue.main.async {
//                            isOffline = true
//                        }
//        }
//        do {
//            try reachability.startNotifier()
//        } catch {
//            print("Error starting reachability notifier: \(error)")
//        }
//
//    }
//
//    private func updateReachabilityStatus() {
//            isOffline = !reachability.isReachable
//        }
//
//    private func stopMonitoringReachability() {
//        reachability.stopNotifier()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//
