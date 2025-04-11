//
//  ContentView.swift
//  Image Preview ios
//
//  Created by Hamza Khalid on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        CircleImage()
            .scaleEffect(0.75)
            .frame(width: 300, height: 300)
            .padding(.top)
            
        VStack(alignment: .leading) {
            TitleView()
            DescriptionView()
        }
        .padding()
        Spacer()
    }
}

#Preview {
    ContentView()
}
