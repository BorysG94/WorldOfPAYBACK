//
//  TransactionRowView.swift
//  WorldOfPAYBACK
//
//  Created by Ola Adamus on 24/05/2023.
//

import SwiftUI

struct TransactionListView: View {
    @ObservedObject var viewModel: TransactionListViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                ScrollView {
                    Text(errorMessage)
                }
            } else {
                VStack {
                    Picker("Category",
                           selection: $viewModel.selectedCategory
                    )
                    {
                        ForEach(viewModel.categories,
                                id: \.self)
                        { category in
                            Text("\(category)")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    Text("Total Amount: \(viewModel.totalAmount)")
                        .padding()
                        .fontWeight(.semibold)
                        .foregroundColor(Color.blue)
                        .foregroundColor(.blue)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                    
                    List(viewModel.transactions) { transaction in
                        NavigationLink(
                            destination: TransactionDetailsView(
                                viewModel: TransactionDetailsViewModel(
                                    transaction: transaction))) {
                            TransactionRowView(transaction: transaction)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchTransactions()
        }
        .refreshable {
            viewModel.loadData()
        }
    }
}
