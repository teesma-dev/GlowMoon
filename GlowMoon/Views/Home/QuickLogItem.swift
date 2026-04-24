//
//  QuickLogItem.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI

struct QuickLogItem: View {
    let category: QuickLogCategory
    
    var body: some View {
        VStack(spacing: 12) {
            Circle()
                .fill(category.color)
                .frame(width: 50, height: 50)
            
            Text(category.title)
                .font(.footnote)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct TabItem: View {
    let icon: String
    let label: String
    let isSelected: Bool
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
            Text(label)
                .font(.caption2)
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(isSelected ? color : .gray.opacity(0.5))
    }
}
