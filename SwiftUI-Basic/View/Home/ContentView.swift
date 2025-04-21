//
//  ContentView.swift
//  Image Preview ios
//
//  Created by Hamza Khalid on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            VStack {
                let currentImage = Image("profile-image")
                
                NavigationLink(destination: ImageViewer(uiImage: UIImage(named: "profile-image") ?? UIImage())) {
                    CircleImage(image: currentImage)
                        .scaleEffect(0.5)
                        .frame(width: 150, height: 150)
                        .padding(.bottom)
                }
                .buttonStyle(.plain) // Prevents default link styling
                
                VStack(alignment: .leading) {
                    TitleView(
                        title: "Hamza Khalid",
                        leftSubtitle: "iOS Developer",
                        rightSubtitle: "Pakistan",
                        titleFont: .title2,
                        subTitleFont: .subheadline
                    )
                    Divider()
                    DescriptionView()
                }
                .padding()
                
                FooterView()
            }
        }
    }
}

#Preview {
    ContentView()
}
