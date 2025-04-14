//
//  ExperienceRow.swift
//  SwiftUI-Basic
//
//  Created by Hamza Khalid on 11/04/2025.
//

import SwiftUI


struct ExperienceRow: View {
    var experience: Experience
    
    var body: some View {
        VStack {
            ExperienceHeader(image: experience.image,
                             title: experience.name, location: experience.city, roleType: experience.roleLocation + " , " + experience.roleType)
            
            ExperienceDetails(title: experience.designation,
                              startDate: experience.startDate, endDate: experience.endDate)
            
            
        }
    }
}

#Preview {
    Group{
        ExperienceRow(experience: experiences[0])
        ExperienceRow(experience: experiences[1])
    }
}
