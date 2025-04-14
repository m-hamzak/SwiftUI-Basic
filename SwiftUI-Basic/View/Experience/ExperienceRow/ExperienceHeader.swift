//
//  ExperienceHeader.swift
//  SwiftUI-Basic
//
//  Created by Hamza Khalid on 11/04/2025.
//

import SwiftUI

struct ExperienceHeader: View {
    var image: Image
    var title: String
    var location: String
    var roleType: String

    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                TitleView(title: title,
                          leftSubtitle: location,
                          rightSubtitle: roleType)
            }
            Spacer()
        }
    }
}
