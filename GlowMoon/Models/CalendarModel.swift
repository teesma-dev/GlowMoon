//
//  CalendarDay.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import Foundation

// Calendar
enum DayStatus {
    case period, fertile, ovulation, pms, today, none
}

struct CalendarDay: Identifiable {
    let id = UUID()
    let dayNumber: Int
    let status: DayStatus
    var isToday: Bool = false
}
