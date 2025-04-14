//
//  ContentView.swift
//  Image Preview ios
//
//  Created by Hamza Khalid on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            CircleImage(image: Image("profile-image"))
                .scaleEffect(0.5)
                .frame(width: 150, height: 150)
                .padding(.bottom)
            
            VStack(alignment: .leading) {
                TitleView(title: "Hamza Khalid",
                          leftSubtitle: "iOS Developer",
                          rightSubtitle: "Pakistan")
                Divider()
                DescriptionView()
            }
            .padding()
            FooterView()
        }
        .navigationTitle("Experience")
    }
}

#Preview {
    ContentView()
}
