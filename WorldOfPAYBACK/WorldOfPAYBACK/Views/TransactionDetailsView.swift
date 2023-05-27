//
//  TransactionDetailsView.swift
//  WorldOfPAYBACK
//
//  Created by Ola Adamus on 24/05/2023.
//

import Foundation
import SwiftUI

struct TransactionDetailsView: View {
    @StateObject var viewModel: TransactionDetailsViewModel
    
    var body: some View {
        VStack {
            Text("Partner: \(viewModel.transaction.partnerDisplayName)")
            Text("Description: \(viewModel.transaction.transactionDetail.description?.rawValue ?? "")")
        }
    }
}
