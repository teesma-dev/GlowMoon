//
//  LogEntryView.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI

struct LogEntryView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedFlow: String = "Light"
    @State private var selectedMood: String = "Happy"
    @State private var selectedSymptoms: Set<String> = ["Cramps", "Bloating"]
    @State private var notes: String = ""
    
    let primaryPink = Color(hex: "e91e8c")
    let backgroundPink = Color(hex: "FFF6F7")
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Log Entry")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.leading, 8)
                
                Spacer()
                
                Text("April 9, 2026")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
            .padding(.bottom, 10)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    LogSectionCard(title: "Flow") {
                        HStack(spacing: 12) {
                            ForEach(["None", "Light", "Medium", "Heavy"], id: \.self) { flow in
                                FlowOption(title: flow, isSelected: selectedFlow == flow, color: primaryPink) {
                                    selectedFlow = flow
                                }
                            }
                        }
                    }
                    
                    LogSectionCard(title: "Mood") {
                        HStack(spacing: 15) {
                            MoodCircle(mood: "Happy", color: .green, isSelected: selectedMood == "Happy") { selectedMood = "Happy" }
                            MoodCircle(mood: "Calm", color: .blue, isSelected: selectedMood == "Calm") { selectedMood = "Calm" }
                            MoodCircle(mood: "Sad", color: .purple, isSelected: selectedMood == "Sad") { selectedMood = "Sad" }
                            MoodCircle(mood: "Anxious", color: .orange, isSelected: selectedMood == "Anxious") { selectedMood = "Anxious" }
                            MoodCircle(mood: "Angry", color: .red, isSelected: selectedMood == "Angry") { selectedMood = "Angry" }
                        }
                    }
                    
                    LogSectionCard(title: "Symptoms") {
                        let symptoms = ["Cramps", "Headache", "Bloating", "Fatigue", "Acne", "Tender"]
                        let columns = [GridItem(.flexible()), GridItem(.flexible())]
                        
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(symptoms, id: \.self) { symptom in
                                SymptomTag(title: symptom, isSelected: selectedSymptoms.contains(symptom), color: primaryPink) {
                                    if selectedSymptoms.contains(symptom) {
                                        selectedSymptoms.remove(symptom)
                                    } else {
                                        selectedSymptoms.insert(symptom)
                                    }
                                }
                            }
                        }
                    }
                    
                    LogSectionCard(title: "Notes") {
                        TextField("Add a note about today...", text: $notes)
                            .padding()
                            .background(Color.gray.opacity(0.05))
                            .cornerRadius(12)
                    }
                    Button(action: { dismiss() }) {
                        Text("Save Entry")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(primaryPink)
                            .cornerRadius(15)
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 80)
                }
                .padding(24)
            }
        }
        .background(backgroundPink.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
}

struct LogSectionCard<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title).font(.headline)
            content
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct FlowOption: View {
    let title: String
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(isSelected ? .white : .gray)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(isSelected ? color : Color.gray.opacity(0.1))
                .cornerRadius(12)
        }
    }
}

struct MoodCircle: View {
    let mood: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            Circle()
                .fill(color)
                .frame(width: 45, height: 45)
                .overlay(Circle().stroke(Color.white, lineWidth: isSelected ? 3 : 0))
                .shadow(color: color.opacity(isSelected ? 0.5 : 0), radius: 5)
                .onTapGesture(perform: action)
            
            Text(mood)
                .font(.system(size: 12))
                .foregroundColor(isSelected ? .black : .gray)
        }
    }
}

struct SymptomTag: View {
    let title: String
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Circle()
                    .fill(isSelected ? color : .gray.opacity(0.4))
                    .frame(width: 16, height: 16)
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(isSelected ? color.opacity(0.1) : Color.gray.opacity(0.05))
            .cornerRadius(25)
        }
    }
}

