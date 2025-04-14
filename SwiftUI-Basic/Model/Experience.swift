//
//  Experience.swift
//  SwiftUI-Basic
//
//  Created by Hamza Khalid on 11/04/2025.
//
import SwiftUI

struct Experience: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var city: String
    var state: String
    var country: String
    var roleType: String
    var roleLocation: String
    var startDate: String
    var endDate: String
    var designation: String
    var description: String
    
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
}
