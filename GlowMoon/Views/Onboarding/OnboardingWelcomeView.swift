//
//  OnboardingWelcomeView.swift
//  GlowMoon
//
//  Created by Teesma M on 21/04/26.
//

import SwiftUI

struct OnboardingWelcomeView: View {
    @State private var showSetup = false
    let primaryPink = Color(hex: "e91e8c")
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "FCE4EC"), .white]),
                startPoint: .top,
                endPoint: .center
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                ZStack {
                    Circle().fill(Color.purple.opacity(0.3)).frame(width: 8, height: 8).offset(x: -80, y: -20)
                    Circle().fill(Color.pink.opacity(0.4)).frame(width: 10, height: 10).offset(x: 100, y: 40)
                    Circle().fill(Color.indigo.opacity(0.3)).frame(width: 6, height: 6).offset(x: -90, y: 80)
                    
                    Image(systemName: "moon.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .foregroundStyle(Color(primaryPink))
                        .rotationEffect(.degrees(-15))
                    
                }
                .padding(.bottom, 40)
                
                VStack(spacing: 16) {
                    Text("Glow Moon")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(Color(hex: "1A1A2E"))
                    
                    Text("Your cycle, your rhythm")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("Track your period, predict your\ncycle, and understand your body better.")
                        .font(.body)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .lineSpacing(4)
                }
                
                Spacer()
                
                VStack(spacing: 20) {
                    Button(action: {
                        showSetup = true
                    }) {
                        Text("Next")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(Color(primaryPink))
                            .cornerRadius(15)
                    }
                    .navigationDestination(isPresented: $showSetup) {
                        OnboardingCycleSetupView()
                    }
                    
                    Button(action: {
                        
                    }) {
                        Text("I already have an account")
                            .font(.subheadline)
                            .foregroundStyle(.purple)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue:  Double(b) / 255, opacity: Double(a) / 255)
    }
}
