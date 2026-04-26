//
//  LogModels.swift
//  GlowMoon
//
//  Created by Teesma M on 26/04/26.
//

import Foundation
import SwiftUI

struct FlowSelection: Identifiable, Hashable {
    let id = UUID()
    let level: String
}

struct MoodOption: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

struct SymptomOption: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct DailyLog: Identifiable {
    let id = UUID()
    var date: Date = Date()
    var flow: String
    var mood: String
    var symptoms: Set<String>
    var notes: String
}
