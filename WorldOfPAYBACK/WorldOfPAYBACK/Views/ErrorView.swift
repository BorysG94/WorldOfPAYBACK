//
//  ErrorView.swift
//  WorldOfPAYBACK
//
//  Created by Ola Adamus on 25/05/2023.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack {
            Text("Error: Device is offline")
                .font(.title)
                .foregroundColor(.red)
        }
    }
}
