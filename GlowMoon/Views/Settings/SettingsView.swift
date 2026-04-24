//
//  SettingsView.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI

struct SettingsView: View {
    let backgroundPink = Color(hex: "FFF6F7")
    
    var body: some View {
        ZStack {
            backgroundPink.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Settings")
                        .font(.system(size: 34, weight: .bold))
                        .padding(.top, 10)
                    
                    SettingsSection(title: "ACCOUNT") {
                        SettingsRow(item: SettingsItem(icon: "person.fill", title: "Profile", iconColor: .blue))
                    }
                    
                    SettingsSection(title: "PREFERENCES") {
                        SettingsRow(item: SettingsItem(icon: "globe", title: "Language", value: "English", iconColor: .blue))
                    }
                    
                    SettingsSection(title: "NOTIFICATIONS") {
                        SettingsRow(item: SettingsItem(icon: "bell.fill", title: "Reminders", value: "4 active", iconColor: .yellow))
                    }
                    
                    SettingsSection(title: "PRIVACY & SAFETY") {
                        SettingsRow(item: SettingsItem(icon: "trash.fill", title: "Delete Account", iconColor: .red, isDestructive: true))
                    }
                    
                    SettingsSection(title: "ABOUT") {
                        SettingsRow(item: SettingsItem(icon: "doc.text.fill", title: "Privacy Policy", iconColor: .brown))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 100)
            }
        }
    }
}
