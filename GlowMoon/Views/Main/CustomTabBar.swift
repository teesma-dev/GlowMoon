//
//  CustomTabBar.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI


struct CustomTabBar: View {
    @Binding var selectedTab: String
    let primaryPink: Color
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            
            TabItem(icon: "house.fill",
                    label: "Home",
                    isSelected: selectedTab == "Home",
                    color: primaryPink)
            .onTapGesture { selectedTab = "Home" }
            
            TabItem(icon: "calendar",
                    label: "Calendar",
                    isSelected: selectedTab == "Calendar",
                    color: primaryPink)
            .onTapGesture { selectedTab = "Calendar" }
            
            Button(action: {
                selectedTab = "Log"
            }) {
                VStack(spacing: 4) {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(selectedTab == "Log" ? primaryPink : .pink)
                    Text("Log")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(selectedTab == "Log" ? .black : .gray)
                }
            }
            .frame(maxWidth: .infinity)
            
            TabItem(icon: "circle.circle",
                    label: "Insights",
                    isSelected: selectedTab == "Insights",
                    color: primaryPink)
            .onTapGesture { selectedTab = "Insights" }
            
            TabItem(icon: "gearshape",
                    label: "Settings",
                    isSelected: selectedTab == "Settings",
                    color: primaryPink)
            .onTapGesture { selectedTab = "Settings" }
        }
        .padding(.horizontal, 10)
        .frame(height: 75)
        .background(
            Color.white
                .shadow(color: .black.opacity(0.05), radius: 10, y: -5)
                .ignoresSafeArea(edges: .bottom)
        )
    }
}
