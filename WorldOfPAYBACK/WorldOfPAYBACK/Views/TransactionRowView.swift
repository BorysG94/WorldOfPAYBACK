//
//  TransactionRowView.swift
//  WorldOfPAYBACK
//
//  Created by Ola Adamus on 24/05/2023.
//
import SwiftUI

struct TransactionRowView: View {
    let transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Booking Date: \(transaction.transactionDetail.bookingDate)")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .foregroundColor(.black)
                .cornerRadius(12)
            Text("Partner: \(transaction.partnerDisplayName)")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .foregroundColor(.black)
                .cornerRadius(12)
            Text("Description: \(transaction.transactionDetail.description?.rawValue ?? "")")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .foregroundColor(.black)
                .cornerRadius(12)
            Text("Amount: \(transaction.transactionDetail.value.amount) \(transaction.transactionDetail.value.currency.rawValue)")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .foregroundColor(.black)
                .cornerRadius(12)
        }
    }
}

