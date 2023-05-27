//
//  TransactionDetailsViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Ola Adamus on 24/05/2023.
//

import Foundation

class TransactionDetailsViewModel: ObservableObject {
    let transaction: Transaction
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
}
