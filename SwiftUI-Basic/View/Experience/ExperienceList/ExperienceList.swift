//
//  ExperienceList.swift
//  SwiftUI-Basic
//
//  Created by Hamza Khalid on 14/04/2025.
//

import SwiftUI

struct ExperienceList: View {
    
    var body: some View {
        
        List {
            ExperienceDetail(experience: experiences[0])
            ExperienceDetail(experience: experiences[1])
        }
    }
}

#Preview {
    ExperienceList()
}
