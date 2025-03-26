//
//  TitleView.swift
//  Image Preview ios
//
//  Created by Hamza Khalid on 26/03/2025.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Hamza Khalid")
            .font(.title)
            .foregroundColor(.blue)
        HStack {
            Text("iOS Developer")
                .font(.headline)
            Spacer()
            Text("Pakistan")
                .font(.headline)
        }
        .foregroundStyle(.secondary)
        Divider()
    }
}

#Preview {
    TitleView()
}
