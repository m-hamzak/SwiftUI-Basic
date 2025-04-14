//
//  DescriptionView.swift
//  Image Preview ios
//
//  Created by Hamza Khalid on 26/03/2025.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Building great apps - one byte at a time.")
                .font(.headline)
                .padding(.bottom)
            Text("Results-driven iOS developer with over 5 years of experience in designing, developing, and maintaining robust and user-friendly mobile applications. Expert in Swift, Objective-C, and utilizing the latest iOS frameworks.Committed to continuous learning and applying new technologies to enhance user experiences.")
                .font(.body)
        }
    }
}

#Preview {
    DescriptionView()
}
