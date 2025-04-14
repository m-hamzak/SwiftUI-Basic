//
//  ExperienceDetail.swift
//  SwiftUI-Basic
//
//  Created by Hamza Khalid on 13/04/2025.
//

import SwiftUI


struct ExperienceDetail: View {
    var experience: Experience
    
    var body: some View {
        VStack {
            ExperienceRow(experience: experience)
        }
    }
}

#Preview {
    ExperienceDetail(experience: experiences[0])
}
