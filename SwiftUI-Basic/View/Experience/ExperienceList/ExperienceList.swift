//
//  ExperienceList.swift
//  SwiftUI-Basic
//
//  Created by Hamza Khalid on 14/04/2025.
//

import SwiftUI

struct ExperienceList: View {
    
    var body: some View {
        
        List(experiences) { experience in
            ExperienceRow(experience: experience)
        }
        .navigationTitle("Experience")
    }
}

#Preview {
    ExperienceList()
}
