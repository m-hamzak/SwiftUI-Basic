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
    var titleFont: Font?
    var subTitleFont: Font?
    
    var body: some View {
        Text(title)
            .font(titleFont ?? .title)
            .foregroundColor(.blue)
        HStack {
            if let leftSubtitle {
                Text(leftSubtitle)
                    .font(subTitleFont ?? .headline)
                Spacer()
            }
            if let rightSubtitle {
                Text(rightSubtitle)
                    .font(subTitleFont ?? .headline)
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
