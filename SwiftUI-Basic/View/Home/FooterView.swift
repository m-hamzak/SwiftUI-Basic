//
//  FooterView.swift
//  SwiftUI-Basic
//
//  Created by Hamza Khalid on 14/04/2025.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        
        HStack {
            NavigationLink(destination: {
                ExperienceList()
            }, label: {
                Text("Experience")
            })
            Spacer()
            NavigationLink(destination: {
                ExperienceDetail(experience: experiences[0])
            }, label: {
                Text("Articles")
            })
            Spacer()
            NavigationLink(destination: {
                ExperienceDetail(experience: experiences[0])
            }, label: {
                Text("Education")
            })
        }
        .padding()
        
    }
}
