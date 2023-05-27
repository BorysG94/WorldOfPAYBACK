//
//  Transaction.swift
//  WorldOfPAYBACK
//
//  Created by Ola Adamus on 24/05/2023.
//
import Foundation

struct Transaction: Codable, Identifiable {
    let id = UUID()
    let partnerDisplayName: String
    let alias: Alias
    let category: Int
    let transactionDetail: TransactionDetail
    
}

struct Alias: Codable {
    let reference: String
}

struct TransactionDetail: Codable {
    let description: Description?
    let bookingDate: String
    let value: Value
}

enum Description: String, Codable {
    case punkteSammeln = "Punkte sammeln"
}

struct Value: Codable {
    let amount: Int
    let currency: Currency
}

enum Currency: String, Codable {
    case pbp = "PBP"
}

class ReadData: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "PBTransactions", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("JSON file not found")
            return
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 // Set date decoding strategy to parse ISO8601 format
        if let transactions = try? decoder.decode([String: [Transaction]].self, from: data),
           let items = transactions["items"] {
            self.transactions = items
        }
    }
}
