////
////  WifiCheckView.swift
////  WorldOfPAYBACK
////
////  Created by Ola Adamus on 25/05/2023.
////
//
//import Foundation
//import SwiftUI
//import Reachability
//
//struct ContentView: View {
//    
//    @State private var isOffline = false
//    @StateObject var data = ReadData()
//    @StateObject var viewModel = TransactionListViewModel()
//    private let reachability = try! Reachability()
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
//            isOffline = false
//        }
//        
//        reachability.whenUnreachable = { _ in
//            isOffline = true
//        }
//        
//        do {
//            try reachability.startNotifier()
//        } catch {
//            print("Error starting reachability notifier: \(error)")
//        }
//    }
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
