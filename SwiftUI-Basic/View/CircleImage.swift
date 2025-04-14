//
//  CircleImage.swift
//  Image Preview ios
//
//  Created by Hamza Khalid on 25/03/2025.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(.circle)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("profile-image"))
}
