//
//  AppearanceView.swift
//  GlowMoon
//
//  Created by Teesma M on 26/04/26.
//

import SwiftUI

struct AppearanceView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("appearance_selection") private var selectedMode: AppearanceMode = .system
    
    let backgroundPink = Color(hex: "FFF6F7")
    let primaryPink = Color(hex: "e91e8c")

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: { dismiss() }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Settings")
                    }
                    .font(.body)
                    .foregroundColor(primaryPink)
                }
                
                Spacer()
                
                Text("Appearance")
                    .font(.headline)
                
                Spacer()
                
                Text("Settings").opacity(0)
            }
            .padding()
            .background(Color.white)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(spacing: 0) {
                        ForEach(AppearanceMode.allCases, id: \.self) { mode in
                            AppearanceRow(
                                title: mode.rawValue,
                                isSelected: selectedMode == mode,
                                primaryColor: primaryPink
                            ) {
                                selectedMode = mode
                            }
                            
                            if mode != AppearanceMode.allCases.last {
                                Divider().padding(.leading, 16)
                            }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(18)
                    .padding(.top, 24)
                    
                    Text("System uses your device's Light/Dark appearance.")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        }
        .background(backgroundPink.ignoresSafeArea())
        .navigationBarHidden(true)
    }
}

struct AppearanceRow: View {
    let title: String
    let isSelected: Bool
    let primaryColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(.primary)
                    .font(.body)
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(primaryColor)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .contentShape(Rectangle()) 
        }
    }
}
