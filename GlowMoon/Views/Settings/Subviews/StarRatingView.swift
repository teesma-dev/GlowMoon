//
//  StarRatingView.swift
//  GlowMoon
//
//  Created by Teesma M on 27/04/26.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    let maxRating = 5

    var body: some View {
        HStack(spacing: 10) {
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: "star.fill")
                    .font(.system(size: 30))
                    .foregroundColor(index <= rating ? .orange : .gray.opacity(0.3))
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}
