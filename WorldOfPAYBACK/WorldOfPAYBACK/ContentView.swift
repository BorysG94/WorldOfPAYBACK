//
//  ContentView.swift
//  WorldOfPAYBACK
//
//  Created by Ola Adamus on 24/05/2023.
//

import Foundation
import SwiftUI
import Reachability

struct ContentView: View {
    @StateObject var viewModel = TransactionListViewModel()
    @StateObject var reachabilityManager = ReachabilityManager()
    
    var body: some View {
        VStack {
            if reachabilityManager.isOffline {
                ErrorView()
                    
            } else {
                NavigationView {
                    TransactionListView(
                    viewModel: viewModel
                    )
                        .navigationTitle("Transactions")
                }
                .refreshable {
                    viewModel.loadData()
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
