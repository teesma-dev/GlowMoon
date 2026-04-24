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
    
    let stats: [StatItem] = [
        StatItem(value: "28", unit: "days", label: "Cycle Length"),
        StatItem(value: "5", unit: "days", label: "Period Length"),
        StatItem(value: "92%", unit: "", label: "Regularity")
    ]
    
    var symptomsData: [SymptomInsight] {
        [
            SymptomInsight(name: "Cramps", percentage: 0.83, color: primaryPink),
            SymptomInsight(name: "Headache", percentage: 0.67, color: .purple),
            SymptomInsight(name: "Bloating", percentage: 0.50, color: Color(hex: "FF85B2")),
            SymptomInsight(name: "Fatigue", percentage: 0.33, color: Color(hex: "9D8AF2")),
            SymptomInsight(name: "Acne", percentage: 0.17, color: primaryPink.opacity(0.4))
        ]
    }
    
    var body: some View {
        ZStack {
            backgroundPink.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Insights")
                        .font(.system(size: 34, weight: .bold))
                        .padding(.top, 10)
                    
                    HStack(spacing: 12) {
                        ForEach(stats) { stat in
                            StatCard(item: stat, color: primaryPink)
                        }
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
                        
                        ForEach(symptomsData) { item in
                            SymptomRow(symptom: item)
                        }
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
