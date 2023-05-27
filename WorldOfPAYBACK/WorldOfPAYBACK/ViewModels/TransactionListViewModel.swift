
//
//  TransactionDetailsView.swift
//  WorldOfPAYBACK
//
//  Created by Ola Adamus on 24/05/2023.
//

import Foundation
import Combine

class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var selectedCategory: Int = 0 {
        didSet {
            filterTransactions(by: selectedCategory)
        }
    }
    
    private var allTransactions: [Transaction] = []
   
    
    init() {
        loadData()
    }
    
    func loadData() {
        errorMessage = nil // i add this to dont have bug in refresh
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            let shouldFail = Bool.random()
            if shouldFail {
                self.errorMessage = "Failed to fetch data"
        
    } else {
        self.allTransactions = ReadData().transactions
        self.filterTransactions(by: self.selectedCategory)
    }
        self.isLoading = false
    }
}
    
    func fetchTransactions() {
        loadData()
    }
    
    func filterTransactions(by category: Int) {
        if category == 0 {
            transactions = allTransactions.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate })
        } else {
            let filteredTransactions = allTransactions.filter { $0.category == category }
            transactions = filteredTransactions.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate })
        }
    }
    
    var categories: [Int] {
        let allCategories = allTransactions.map { $0.category }
        return Array(Set(allCategories)).sorted()
    }
    
    var totalAmount: Int {
        transactions.reduce(0) { $0 + $1.transactionDetail.value.amount }
    }
}

