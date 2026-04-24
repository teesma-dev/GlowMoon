//
//  SettingsSection.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI

struct SettingsSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.gray)
                .padding(.leading, 4)
            
            VStack(spacing: 0) {
                content
            }
            .background(Color.white)
            .cornerRadius(16)
        }
    }
}
