//
//  HomeDashboardView.swift
//  GlowMoon
//
//  Created by Teesma M on 22/04/26.
//

import SwiftUI

struct HomeDashboardView: View {
    let primaryPink = Color(hex: "e91e8c")
    let backgroundPink = Color(hex: "FFF6F7")
    
    var body: some View {
        ZStack(alignment: .bottom) {
            backgroundPink
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                                VStack(alignment: .leading, spacing: 4) {
                        Text("Good morning,")
                            .font(.body)
                            .foregroundColor(.gray)
                        HStack {
                            Text("Teeshma")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                            Spacer()
                        }
                        Text("Wednesday, April 9")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                    
                    VStack(spacing: 20) {
                        ZStack {
                            Circle()
                                .stroke(Color.white, lineWidth: 20)
                                .shadow(color: .black.opacity(0.05), radius: 10)
                            
                            Circle()
                                .stroke(primaryPink.opacity(0.1), lineWidth: 12)
                            
                            Circle()
                                .trim(from: 0, to: 0.6)
                                .stroke(
                                    primaryPink,
                                    style: StrokeStyle(lineWidth: 12, lineCap: .round)
                                )
                                .rotationEffect(.degrees(-90))
                            
                            VStack(spacing: 4) {
                                Text("Day").font(.subheadline).foregroundColor(.gray)
                                Text("14").font(.system(size: 60, weight: .bold, design: .rounded))
                                Text("Ovulation Day").font(.subheadline).fontWeight(.medium).foregroundColor(primaryPink)
                            }
                        }
                        .frame(width: 260, height: 260)
                        
                        Label("Fertile Window", systemImage: "leaf.fill")
                            .font(.subheadline.bold())
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.green.opacity(0.7))
                            .clipShape(Capsule())
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Next period in")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("14 days")
                                    .font(.title2.bold())
                                    .foregroundColor(primaryPink)
                                Text("Expected: Apr 23 - Apr 27")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 100, height: 8)
                                .overlay(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(primaryPink)
                                        .frame(width: 60, height: 8)
                                }
                        }
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 24)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Quick Log")
                            .font(.title3.bold())
                            .padding(.horizontal, 24)
                        
                        HStack(spacing: 16) {
                            QuickLogItem(title: "Mood", color: Color(hex: "fbcfe7"))
                            QuickLogItem(title: "Symptoms", color: Color(hex: "baf8d0"))
                            QuickLogItem(title: "Notes", color: Color(hex: "e0e6ff"))
                        }
                        .padding(.horizontal, 24)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Today's Log")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                        
                        HStack {
                            Text("😊 Happy")
                            Text("•")
                            Text("No symptoms")
                            Text("•")
                            Text("Light flow")
                        }
                        .font(.system(size: 15))
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 24)
                    
                    Color.clear.frame(height: 120)
                }
            }
            
            VStack(spacing: 0) {
                CustomTabBar(primaryPink: primaryPink)
                    .background(Color.white)
                    .padding(.bottom, 0)
            }
            .background(Color.white.ignoresSafeArea(edges: .bottom))
            .shadow(color: .black.opacity(0.05), radius: 10, y: -5)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct QuickLogItem: View {
    let title: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 12) {
            Circle()
                .fill(color)
                .frame(width: 50, height: 50)
            
            Text(title)
                .font(.footnote)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct CustomTabBar: View {
    let primaryPink: Color
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            TabItem(icon: "house", label: "Home", isSelected: true, color: primaryPink)
            TabItem(icon: "calendar", label: "Calendar", isSelected: false, color: primaryPink)
            Button(action: {}) {
                VStack(spacing: 4) {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.pink)
                        .frame(width: 20, height: 20)
                    Text("Log")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity)
            TabItem(icon: "circle.circle", label: "Insights", isSelected: false, color: primaryPink)
            TabItem(icon: "gearshape", label: "Settings", isSelected: false, color: primaryPink)
        }
        .padding(.horizontal, 10)
        .frame(height: 60)
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
        .foregroundColor(isSelected ? color : .gray)
    }
}
