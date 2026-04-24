//
//  CalendarDayView.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI

struct CalendarDayView: View {
    let item: CalendarDay
    
    var body: some View {
        Text("\(item.dayNumber)")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(textColor)
            .frame(width: 36, height: 36)
            .background(backgroundColor)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(item.isToday ? Color(hex: "e91e8c") : Color.clear, lineWidth: 2)
            )
    }
    
    private var backgroundColor: Color {
        switch item.status {
        case .period: return Color(hex: "E55B5B")
        case .fertile: return Color(hex: "A8E6CF")
        case .ovulation: return Color(hex: "56C568")
        case .pms: return Color(hex: "E18AAA")
        default: return Color.clear
        }
    }
    
    private var textColor: Color {
        item.status == .none || item.status == .today ? .black : .white
    }
}

struct LegendItem: View {
    let color: Color
    let label: String
    var body: some View {
        HStack(spacing: 4) {
            Circle().fill(color).frame(width: 8, height: 8)
            Text(label).foregroundColor(.gray)
        }
    }
}

struct UpcomingRow: View {
    let color: Color
    let title: String
    let date: String
    var body: some View {
        HStack {
            Circle().fill(color).frame(width: 10, height: 10)
            Text(title).font(.subheadline)
            Spacer()
            Text(date).font(.subheadline).foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
    }
}

