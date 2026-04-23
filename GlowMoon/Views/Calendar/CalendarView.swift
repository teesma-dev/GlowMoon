//
//  CalendarView.swift
//  GlowMoon
//
//  Created by Teesma M on 23/04/26.
//

import SwiftUI

struct CalendarView: View {
    let primaryPink = Color(hex: "e91e8c")
    let backgroundPink = Color(hex: "FFF6F7")
    
    let periodColor = Color(hex: "E55B5B")
    let fertileColor = Color(hex: "A8E6CF")
    let ovulationColor = Color(hex: "56C568")
    let pmsColor = Color(hex: "E18AAA")
    
    let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]
    @State private var currentMonth: Date = Date()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            backgroundPink.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Calendar")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack {
                            Text(currentMonth, format: .dateTime.month(.wide).year())
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            HStack(spacing: 20) {
                                Button(action: { moveMonth(by: -1) }) {
                                    Image(systemName: "chevron.left")
                                        .font(.title3.bold())
                                        .foregroundColor(primaryPink)
                                }
                                
                                Button(action: { moveMonth(by: 1) }) {
                                    Image(systemName: "chevron.right")
                                        .font(.title3.bold())
                                        .foregroundColor(primaryPink)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                    
                    VStack(spacing: 15) {
                        HStack {
                            ForEach(daysOfWeek, id: \.self) { day in
                                Text(day)
                                    .font(.caption.bold())
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        
                        let columns = Array(repeating: GridItem(.flexible()), count: 7)
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(0..<3, id: \.self) { _ in Text("") }
                            
                            ForEach(1...30, id: \.self) { day in
                                CalendarDayView(day: day,
                                               status: getStatus(for: day),
                                               isToday: day == 9)
                            }
                        }
                    }
                    .padding(20)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(24)
                    .padding(.horizontal, 16)
                    
                    HStack(spacing: 15) {
                        LegendItem(color: periodColor, label: "Period")
                        LegendItem(color: fertileColor, label: "Fertile")
                        LegendItem(color: ovulationColor, label: "Ovulation")
                        LegendItem(color: pmsColor, label: "PMS")
                    }
                    .font(.caption)
                    .padding(.horizontal, 24)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("April 9 — Today")
                            .font(.title3.bold())
                        
                        HStack {
                            Text("Day 9 • Safe")
                                .font(.caption2)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(hex: "e0e6ff"))
                                .foregroundColor(.black)
                                .clipShape(Capsule())
                        }
                        
                        Text("😊 Happy  •  No flow")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("Symptoms: None logged")
                            .font(.caption)
                            .foregroundColor(.gray.opacity(0.6))
                        
                        HStack {
                            Spacer()
                            Button("Edit Log →") { }
                                .font(.subheadline.bold())
                                .foregroundColor(primaryPink)
                        }
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(24)
                    .padding(.horizontal, 24)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Upcoming")
                            .font(.title3.bold())
                        
                        UpcomingRow(color: fertileColor, title: "Fertile window starts", date: "Apr 10")
                        UpcomingRow(color: periodColor, title: "Next period expected", date: "Apr 23")
                    }
                    .padding(.horizontal, 24)
                    
                    Color.clear.frame(height: 120)
                }
            }
        }
    }
    private func moveMonth(by value: Int) {
        if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: currentMonth) {
            currentMonth = newMonth
        }
    }
    func getStatus(for day: Int) -> DayStatus {
        if day <= 5 { return .period }
        if day == 9 { return .today }
        if (10...14).contains(day) { return .fertile }
        if day == 14 { return .ovulation }
        if (23...25).contains(day) { return .pms }
        return .none
    }
}

enum DayStatus {
    case period, fertile, ovulation, pms, today, none
}

struct CalendarDayView: View {
    let day: Int
    let status: DayStatus
    let isToday: Bool
    
    var body: some View {
        Text("\(day)")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(textColor)
            .frame(width: 36, height: 36)
            .background(backgroundColor)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(isToday ? Color(hex: "e91e8c") : Color.clear, lineWidth: 2)
            )
    }
    
    var backgroundColor: Color {
        switch status {
        case .period: return Color(hex: "E55B5B")
        case .fertile: return Color(hex: "A8E6CF")
        case .ovulation: return Color(hex: "56C568")
        case .pms: return Color(hex: "E18AAA")
        default: return Color.clear
        }
    }
    
    var textColor: Color {
        status == .none || status == .today ? .black : .white
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
