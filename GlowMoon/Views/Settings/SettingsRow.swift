//
//  SettingsRow.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI

struct SettingsRow: View {
    let item: SettingsItem
    
    var body: some View {
        Button(action: {  }) {
            HStack(spacing: 16) {
                Image(systemName: item.icon)
                    .font(.system(size: 18))
                    .foregroundColor(item.iconColor)
                    .frame(width: 30)
                
                Text(item.title)
                    .foregroundColor(item.isDestructive ? .red : .primary)
                    .font(.body)
                
                Spacer()
                
                if let value = item.value {
                    Text(value)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray.opacity(0.4))
            }
            .padding(.vertical, 18)
            .padding(.horizontal, 16)
        }
    }
}
