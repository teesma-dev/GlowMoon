//
//  RateAppAlert.swift
//  GlowMoon
//
//  Created by Teesma M on 27/04/26.
//

import SwiftUI

struct RateAppAlert: View {
    @Binding var isPresented: Bool
    @State private var rating: Int = 0
    let primaryPink = Color(hex: "e91e8c")

    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
            
            VStack(spacing: 0) {
                VStack(spacing: 12) {
                    Text("Enjoying GlowMoon?")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("Tap a star to rate Lunaa in the App Store.\nYour rating helps other people discover us.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 20)
                    
                    StarRatingView(rating: $rating)
                        .padding(.vertical, 10)
                }
                .padding(.vertical, 25)
                
                Divider()
                
                HStack(spacing: 0) {
                    Button(action: { isPresented = false }) {
                        Text("Not Now")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .font(.body)
                    }
                    
                    Divider().frame(height: 50)
                    
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("Rate")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .font(.body)
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(14)
            .padding(.horizontal, 40)
            .shadow(radius: 10)
        }
    }
}
