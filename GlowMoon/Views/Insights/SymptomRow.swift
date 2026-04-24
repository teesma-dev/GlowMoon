//
//  SymptomRow.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI

struct StatCard: View {
    let item: StatItem
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text(item.value)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(color)
                Text(item.unit)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct SymptomRow: View {
    let symptom: SymptomInsight
    
    var body: some View {
        HStack {
            Text(symptom.name)
                .font(.subheadline)
                .frame(width: 80, alignment: .leading)
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 12)
                    Capsule()
                        .fill(symptom.color)
                        .frame(width: geo.size.width * symptom.percentage, height: 12)
                }
            }
            .frame(height: 12)
            
            Text("\(Int(symptom.percentage * 100))%")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(width: 35, alignment: .trailing)
        }
    }
}
