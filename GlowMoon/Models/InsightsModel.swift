//
//  CycleData.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import Foundation
import SwiftUI

// Insights
struct CycleData: Identifiable {
    let id = UUID()
    let month: String
    let length: Int
}

struct SymptomInsight: Identifiable {
    let id = UUID()
    let name: String
    let percentage: Double
    let color: Color
}

struct StatItem: Identifiable {
    let id = UUID()
    let value: String
    let unit: String
    let label: String 
}
