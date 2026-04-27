//
//  SettingsRow.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI

struct SettingsRow: View {
    let item: SettingItem
    var showChevron: Bool = true
    
    var body: some View {
        HStack(spacing: 16) {
            item.icon
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(item.isDestructive ? .red : .primary)
            
            Text(item.title)
                .font(.body)
                .foregroundStyle(item.isDestructive ? .red : .primary)
            
            Spacer()
            
            switch item.type {
            case .navigation:
                HStack(spacing: 8) {
                    if let detail = item.detailText {
                        Text(detail)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    if showChevron {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.gray.opacity(0.5))
                    }
                }
            case .toggle(let binding):
                Toggle("", isOn: binding)
                    .tint(Color(hex: "e91e8c"))
                    .labelsHidden()
            }
        }
        .padding(.vertical, 4)
    }
}
