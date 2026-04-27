//
//  ReminderSoundView.swift
//  GlowMoon
//
//  Created by Teesma M on 27/04/26.
//

import SwiftUI

struct ReminderSoundView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @AppStorage("reminder_sound") private var selectedSound: String = "Default"
    
    let backgroundPink = Color(hex: "FFF6F7")
    let primaryPink = Color(hex: "e91e8c")
    
    let sounds = ["Default", "Chime", "Gentle", "Bell", "None"]
    
    var body: some View {
        VStack(spacing: 0) {
            customHeader
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(spacing: 0) {
                        ForEach(sounds, id: \.self) { sound in
                            SoundRow(
                                title: sound,
                                isSelected: selectedSound == sound,
                                tint: primaryPink
                            ) {
                                selectedSound = sound
                                playPreview(sound)
                            }
                            
                            if sound != sounds.last {
                                Divider().padding(.leading, 16)
                            }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(18)
                    .padding(.top, 24)
                    
                    Text("Tap a sound to preview.")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                }
                .padding(.horizontal, 20)
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
            Text("Reminder Sound").font(.headline)
            Spacer()
            Text("Settings").opacity(0)
        }
        .padding()
        .background(Color.white)
    }
    
    private func playPreview(_ soundName: String) {
        print("Playing preview for: \(soundName)")
    }
}

struct SoundRow: View {
    let title: String
    let isSelected: Bool
    let tint: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(.primary)
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(tint)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .contentShape(Rectangle())
        }
    }
}
