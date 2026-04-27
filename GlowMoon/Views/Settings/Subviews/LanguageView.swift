//
//  LanguageView.swift
//  GlowMoon
//
//  Created by Teesma M on 27/04/26.
//

import SwiftUI

struct LanguageView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedLanguage: String = "English"
    @Environment(\.presentationMode) var presentationMode
    
    let backgroundPink = Color(hex: "FFF6F7")
    let primaryPink = Color(hex: "e91e8c")
    
    let languages: [LanguageOption] = [
        .init(name: "English", isEnabled: true),
        .init(name: "Spanish", isEnabled: false),
        .init(name: "French", isEnabled: false),
        .init(name: "German", isEnabled: false),
        .init(name: "Portuguese", isEnabled: false),
        .init(name: "Italian", isEnabled: false),
        .init(name: "Japanese", isEnabled: false),
        .init(name: "Korean", isEnabled: false),
        .init(name: "Simplified Chinese", isEnabled: false)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            customHeader
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(spacing: 0) {
                        ForEach(languages) { language in
                            LanguageRow(
                                language: language,
                                isSelected: selectedLanguage == language.name,
                                tint: primaryPink
                            ) {
                                if language.isEnabled {
                                    selectedLanguage = language.name
                                }
                            }
                            
                            if language.id != languages.last?.id {
                                Divider().padding(.leading, 16)
                            }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(18)
                    .padding(.top, 24)
                    
                    Text("Additional languages coming in future updates.")
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
            Text("Language").font(.headline)
            Spacer()
            Text("Settings").opacity(0)
        }
        .padding()
        .background(Color.white)
    }
}

struct LanguageRow: View {
    let language: LanguageOption
    let isSelected: Bool
    let tint: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(language.name)
                    .foregroundColor(language.isEnabled ? .primary : .gray.opacity(0.5))
                
                Spacer()
                
                if language.isEnabled {
                    if isSelected {
                        Image(systemName: "checkmark")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(tint)
                    }
                } else {
                    Text("Coming Soon")
                        .font(.caption)
                        .foregroundColor(.gray.opacity(0.5))
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
        }
        .disabled(!language.isEnabled)
    }
}
