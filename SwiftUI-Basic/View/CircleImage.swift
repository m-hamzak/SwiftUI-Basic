//
//  CircleImage.swift
//  Image Preview ios
//
//  Created by Hamza Khalid on 25/03/2025.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("profile-image")
            .clipShape(.circle)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
