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
    
    let flows = ["None", "Light", "Medium", "Heavy"]
    
    var moods: [MoodOption] {
        [
            MoodOption(name: "Happy", color: .green),
            MoodOption(name: "Calm", color: .blue),
            MoodOption(name: "Sad", color: .purple),
            MoodOption(name: "Anxious", color: .orange),
            MoodOption(name: "Angry", color: .red)
        ]
    }
    
    let symptomsList = ["Cramps", "Headache", "Bloating", "Fatigue", "Acne", "Tender"]
    
    var body: some View {
        VStack(spacing: 0) {
            headerSection
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    LogSectionCard(title: "Flow") {
                        HStack(spacing: 12) {
                            ForEach(flows, id: \.self) { flow in
                                FlowOption(title: flow, isSelected: selectedFlow == flow, color: primaryPink) {
                                    selectedFlow = flow
                                }
                            }
                        }
                    }
                    
                    LogSectionCard(title: "Mood") {
                        HStack(spacing: 15) {
                            ForEach(moods) { mood in
                                MoodCircle(mood: mood, isSelected: selectedMood == mood.name) {
                                    selectedMood = mood.name
                                }
                            }
                        }
                    }
                    
                    LogSectionCard(title: "Symptoms") {
                        let columns = [GridItem(.flexible()), GridItem(.flexible())]
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(symptomsList, id: \.self) { symptom in
                                SymptomTag(title: symptom, isSelected: selectedSymptoms.contains(symptom), color: primaryPink) {
                                    toggleSymptom(symptom)
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
                    
                    saveButton
                }
                .padding(24)
            }
        }
        .background(backgroundPink.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
        
    private var headerSection: some View {
        HStack {
            Text("Log Entry").font(.system(size: 28, weight: .bold)).padding(.leading, 8)
            Spacer()
            Text("April 9, 2026").font(.subheadline).foregroundColor(.gray)
        }
        .padding(.horizontal, 24).padding(.top, 20).padding(.bottom, 10)
    }
    
    private var saveButton: some View {
        Button(action: { dismiss() }) {
            Text("Save Entry")
                .font(.headline).foregroundColor(.white)
                .frame(maxWidth: .infinity).frame(height: 60)
                .background(primaryPink).cornerRadius(15)
        }
        .padding(.top, 10).padding(.bottom, 80)
    }
    
    private func toggleSymptom(_ symptom: String) {
        if selectedSymptoms.contains(symptom) {
            selectedSymptoms.remove(symptom)
        } else {
            selectedSymptoms.insert(symptom)
        }
    }
}
