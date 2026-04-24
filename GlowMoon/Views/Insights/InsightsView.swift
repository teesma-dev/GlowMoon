//
//  InsightsView.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI
import Charts

struct InsightsView: View {
    let primaryPink = Color(hex: "e91e8c")
    let backgroundPink = Color(hex: "FFF6F7")
    
    let cycleData: [CycleData] = [
        .init(month: "Nov", length: 80),
        .init(month: "Dec", length: 50),
        .init(month: "Jan", length: 75),
        .init(month: "Feb", length: 35),
        .init(month: "Mar", length: 50),
        .init(month: "Apr", length: 20)
    ]
    
    var body: some View {
        ZStack {
            backgroundPink.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Insights")
                        .font(.system(size: 34, weight: .bold))
                        .padding(.top, 10)
                    
                    HStack(spacing: 12) {
                        StatCard(value: "28", unit: "days", color: primaryPink)
                        StatCard(value: "5", unit: "days", color: primaryPink)
                        StatCard(value: "92%", unit: "", color: primaryPink)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Cycle Length Trend").font(.system(size: 18, weight: .bold))
                            Spacer()
                            Text("Last 6 months").font(.caption).foregroundColor(.gray)
                        }
                        
                        Chart(cycleData) { data in
                            LineMark(
                                x: .value("Month", data.month),
                                y: .value("Length", data.length)
                            )
                            .foregroundStyle(primaryPink)
                            .interpolationMethod(.linear)
                            .lineStyle(StrokeStyle(lineWidth: 3))
                            
                            PointMark(
                                x: .value("Month", data.month),
                                y: .value("Length", data.length)
                            )
                            .foregroundStyle(primaryPink)
                        }
                        .frame(height: 90)
                        .chartYAxis(.hidden)
                        .chartXAxis {
                            AxisMarks(values: cycleData.map { $0.month }) { _ in
                                AxisValueLabel()
                                    .font(.system(size: 12))
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Next Period Prediction")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("April 23 – 27")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(primaryPink)
                        Text("High confidence • Based on 6 cycles")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(primaryPink.opacity(0.08))
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(primaryPink.opacity(0.3), lineWidth: 1))
                    )
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Top Symptoms").font(.headline)
                        
                        SymptomRow(name: "Cramps", percentage: 0.83, color: primaryPink)
                        SymptomRow(name: "Headache", percentage: 0.67, color: .purple)
                        SymptomRow(name: "Bloating", percentage: 0.50, color: .init(hex: "FF85B2"))
                        SymptomRow(name: "Fatigue", percentage: 0.33, color: .init(hex: "9D8AF2"))
                        SymptomRow(name: "Acne", percentage: 0.17, color: primaryPink.opacity(0.4))
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(20)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 100)
            }
        }
    }
}

struct StatCard: View {
    let value: String
    let unit: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text(value)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(color)
                Text(unit)
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
    let name: String
    let percentage: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text(name)
                .font(.subheadline)
                .frame(width: 80, alignment: .leading)
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 12)
                    Capsule()
                        .fill(color)
                        .frame(width: geo.size.width * percentage, height: 12)
                }
            }
            .frame(height: 12)
            
            Text("\(Int(percentage * 100))%")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(width: 35, alignment: .trailing)
        }
    }
}
