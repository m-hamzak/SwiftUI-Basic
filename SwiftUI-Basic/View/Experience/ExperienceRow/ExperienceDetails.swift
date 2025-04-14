//
//  ExperienceDetails.swift
//  SwiftUI-Basic
//
//  Created by Hamza Khalid on 11/04/2025.
//

import SwiftUI

struct ExperienceDetails: View {
    
    var title: String
    var startDate: String
    var endDate: String
    
    var duration: String {
        return "1 mth"
    }

    var body: some View {
        
        VStack (alignment: .leading){
            Text(title)
                .font(.title3)
                .padding(.leading)
            
            HStack {
                    Text(startDate + " -")
                        .font(.headline)

                    Text(endDate)
                        .font(.headline)
                
                Spacer()
                
                Text(duration)
                    .font(.headline)
            }
            .foregroundStyle(.secondary)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ExperienceDetails(title: "Senior Software Engineer", startDate: "Jan 2020", endDate: "May 2022")
}
