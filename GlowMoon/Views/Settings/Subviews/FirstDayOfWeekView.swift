//
//  FirstDayOfWeekView.swift
//  GlowMoon
//
//  Created by Teesma M on 27/04/26.
//

import SwiftUI

struct FirstDayOfWeekView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("first_day_of_week") private var selectedDay: String = "Sunday"
    
    let backgroundPink = Color(hex: "FFF6F7")
    let primaryPink = Color(hex: "e91e8c")
    
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    var body: some View {
        VStack(spacing: 0) {
            customHeader
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(spacing: 0) {
                        ForEach(days, id: \.self) { day in
                            DayRow(
                                title: day,
                                isSelected: selectedDay == day,
                                tint: primaryPink
                            ) {
                                selectedDay = day
                            }
                            
                            if day != days.last {
                                Divider().padding(.leading, 16)
                            }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(18)
                    .padding(.top, 24)
                }
                .padding(.horizontal, 20)
            }
        }
        .background(backgroundPink.ignoresSafeArea())
        .navigationBarHidden(true)
    }
    
    private var customHeader: some View {
        HStack {
            Button(action: { dismiss() }) {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                    Text("Settings")
                }
                .foregroundColor(primaryPink)
            }
            Spacer()
            Text("First Day of Week").font(.headline)
            Spacer()
            Text("Settings").opacity(0)
        }
        .padding()
        .background(Color.white)
    }
}

struct DayRow: View {
    let title: String
    let isSelected: Bool
    let tint: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(.primary)
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(tint)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
        }
    }
}
