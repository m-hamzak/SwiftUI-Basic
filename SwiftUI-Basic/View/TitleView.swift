//
//  TitleView.swift
//  Image Preview ios
//
//  Created by Hamza Khalid on 26/03/2025.
//

import SwiftUI

struct TitleView: View {
    var title: String
    var leftSubtitle: String?
    var rightSubtitle: String?
    
    var body: some View {
        Text(title)
            .font(.title)
            .foregroundColor(.blue)
        HStack {
            if let leftSubtitle {
                Text(leftSubtitle)
                    .font(.headline)
                Spacer()
            }
            if let rightSubtitle {
                Text(rightSubtitle)
                    .font(.headline)
            }
        }
        .foregroundStyle(.secondary)
    }
}

#Preview {
    TitleView(title: "Hamza Khalid",
              leftSubtitle: "iOS Developer",
              rightSubtitle: "Pakistan")
}
