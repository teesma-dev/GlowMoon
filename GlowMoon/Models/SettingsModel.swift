//
//  SettingsItem.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import Foundation
import SwiftUI

// Settings
struct SettingsItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    var value: String? = nil
    let iconColor: Color
    var isDestructive: Bool = false
}
