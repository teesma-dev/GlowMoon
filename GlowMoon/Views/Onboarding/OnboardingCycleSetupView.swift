//
//  OnboardingCycleSetup.swift
//  GlowMoon
//
//  Created by Teesma M on 22/04/26.
//

import SwiftUI

struct OnboardingCycleSetupView: View {
    @State private var lastPeriodDate = Date()
    @State private var cycleLength = 28
    @State private var navigateToHome = false
    
    let primaryPink = Color(hex: "e91e8c")
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 12) {
                Text("When did your last period start?")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundStyle(Color(hex: "1A1A2E"))
                
                Text("This helps us predict your cycle accurately")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.top, 30)
            
            DatePicker("", selection: $lastPeriodDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .tint(primaryPink)
                .padding(.horizontal, 16)
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("Average cycle length")
                    .font(.headline)
                    .fontWeight(.bold)
                
                HStack(spacing: 0) {
                    Button(action: { if cycleLength > 21 { cycleLength -= 1 } }) {
                        Image(systemName: "minus")
                            .font(.system(size: 14, weight: .bold))
                            .frame(width: 44, height: 44)
                            .foregroundStyle(primaryPink)
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 18) {
                        Text("\(cycleLength)")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                        Text("days")
                            .font(.body)
                            .foregroundStyle(.gray)
                            .baselineOffset(4)
                    }
                    
                    Spacer()
                    
                    Button(action: { if cycleLength < 45 { cycleLength += 1 } }) {
                        Image(systemName: "plus")
                            .font(.system(size: 14, weight: .bold))
                            .frame(width: 44, height: 44)
                            .foregroundStyle(primaryPink)
                    }
                }
                .padding(.horizontal, 10)
                .frame(width: 240, height: 60)
                .background(Color.white)
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
            }
            .padding(.bottom, 30)
            
            VStack(spacing: 16) {
                Button(action: {
                    navigateToHome = true
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(primaryPink)
                        .cornerRadius(15)
                }
                .navigationDestination(isPresented: $navigateToHome) {
                    HomeDashboardView()
                }
                Button(action: {
                }) {
                    Text("I'm not sure, skip for now")
                        .font(.subheadline)
                        .foregroundStyle(.purple.opacity(0.7))
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 20)
        }
        .background(Color(hex: "fff6f7"))
        .navigationBarBackButtonHidden(true)
    }
}
