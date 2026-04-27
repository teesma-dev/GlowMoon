//
//  LegalView.swift
//  GlowMoon
//
//  Created by Teesma M on 27/04/26.
//

import SwiftUI

struct LegalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    let title: String
    let content: String
    
    let backgroundPink = Color(hex: "FFF6F7")
    let primaryPink = Color(hex: "e91e8c")
    let badgeYellow = Color(hex: "FDF4D4")
    let badgeText = Color(hex: "856404")
    
    var body: some View {
        VStack(spacing: 0) {
            customHeader
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack(spacing: 6) {
                        Image(systemName: "exclamationmark.triangle.fill")
                        Text("DRAFT · Awaiting Legal Review")
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(badgeYellow)
                    .foregroundColor(badgeText)
                    .cornerRadius(8)
                    
                    Text("Lunaa \(title)")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(content)
                        .font(.body)
                        .lineSpacing(4)
                        .foregroundColor(.primary.opacity(0.8))
                }
                .padding(24)
                .padding(.bottom, 50)
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 20)
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
            Text(title).font(.headline)
            Spacer()
            Text("Settings").opacity(0)
        }
        .padding()
        .background(Color.white)
    }
}
