//
//  LogComponents.swift
//  GlowMoon
//
//  Created by Teesma M on 26/04/26.
//

import Foundation
import SwiftUI

struct LogSectionCard<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title).font(.headline)
            content
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct FlowOption: View {
    let title: String
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(isSelected ? .white : .gray)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(isSelected ? color : Color.gray.opacity(0.1))
                .cornerRadius(12)
        }
    }
}

struct MoodCircle: View {
    let mood: MoodOption
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            Circle()
                .fill(mood.color)
                .frame(width: 45, height: 45)
                .overlay(Circle().stroke(Color.white, lineWidth: isSelected ? 3 : 0))
                .shadow(color: mood.color.opacity(isSelected ? 0.5 : 0), radius: 5)
                .onTapGesture(perform: action)
            
            Text(mood.name)
                .font(.system(size: 12))
                .foregroundColor(isSelected ? .black : .gray)
        }
    }
}

struct SymptomTag: View {
    let title: String
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Circle()
                    .fill(isSelected ? color : .gray.opacity(0.4))
                    .frame(width: 16, height: 16)
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(isSelected ? color.opacity(0.1) : Color.gray.opacity(0.05))
            .cornerRadius(25)
        }
    }
}
