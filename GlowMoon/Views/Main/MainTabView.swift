//
//  MainTabView.swift
//  GlowMoon
//
//  Created by Teesma M on 23/04/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: String = "Home"
    let primaryPink = Color(hex: "e91e8c")

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                if selectedTab == "Home" {
                    HomeDashboardView(selectedTab: $selectedTab)
                } else if selectedTab == "Calendar" {
                    CalendarView()
                } else if selectedTab == "Log" {
                    LogEntryView()
                } else if selectedTab == "Insights"{
                    InsightsView()
                } else {
                    Text("\(selectedTab) View")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(hex: "FFF6F7"))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabBar(selectedTab: $selectedTab, primaryPink: primaryPink)
        }
        .ignoresSafeArea(.keyboard)
    }
}
