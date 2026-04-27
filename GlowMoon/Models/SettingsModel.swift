//
//  SettingsItem.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import Foundation
import SwiftUI

enum SettingType {
    case navigation
    case toggle(Binding<Bool>)
}

struct SettingItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: Image
    var detailText: String? = nil
    var type: SettingType = .navigation
    var isDestructive: Bool = false
}

struct SettingSection: Identifiable {
    let id = UUID()
    let header: String
    let items: [SettingItem]
}

enum AppearanceMode: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
}

struct LanguageOption: Identifiable {
    let id = UUID()
    let name: String
    let isEnabled: Bool
}

struct SoundOption: Identifiable {
    let id = UUID()
    let name: String
}

struct ExportDocument: Identifiable {
    let id = UUID()
    let url: URL
}
