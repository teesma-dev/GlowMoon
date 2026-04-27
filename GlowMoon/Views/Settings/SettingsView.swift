//
//  SettingsView.swift
//  GlowMoon
//
//  Created by Teesma M on 24/04/26.
//

import SwiftUI

struct SettingsView: View {
    @State private var pushNotifications = true
    @State private var icloudSync = true
    @State private var showExportAlert = false
    @State private var showShareSheet = false
    @State private var exportURL: URL?
    @State private var exportItems: [Any] = []
    @State private var exportDoc: ExportDocument?
    @State private var showClearDataAlert = false
    @State private var isCloudSyncEnabled = true
    @State private var showCloudSyncAlert = false
    @State private var showRateAppAlert = false
    @State private var showAppearance = false
    @State private var showLanguageView = false
    @State private var showFirstDayView = false
    @State private var showReminderSoundView = false
    @State private var showTOS = false
    @State private var showPrivacy = false
    
    let backgroundPink = Color(hex: "FFF6F7")
    let primaryPink = Color(hex: "e91e8c")
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        Text("Settings")
                            .font(.system(size: 34, weight: .bold))
                            .padding(.top, 20)
                        
                        SettingsCard(title: "GENERAL") {
                            Button(action: { showAppearance = true }) {
                                SettingsRow(item: .init(title: "Appearance", icon: .icAppearance, detailText: "System"))
                            }
                            .fullScreenCover(isPresented: $showAppearance) {
                                AppearanceView() 
                            }
                            Divider()
                            Button(action: {
                                showLanguageView = true
                            }) {
                                SettingsRow(item: .init(title: "Language", icon: .icLang, detailText: "English"))
                            }
                            .fullScreenCover(isPresented: $showLanguageView) {
                                LanguageView()
                            }
                            Divider()
                            Button(action: {
                                showFirstDayView = true
                            }) {
                                SettingsRow(item: .init(title: "First Day of Week", icon: .icDays, detailText: "Sunday"))
                            }
                            .fullScreenCover(isPresented: $showFirstDayView) {
                                FirstDayOfWeekView()
                            }
                        }
                        
                        SettingsCard(title: "NOTIFICATIONS") {
                            SettingsRow(item: .init(title: "Push Notifications", icon: .icNotify, type: .toggle($pushNotifications)))
                            Divider()
                            Button(action: {
                                showReminderSoundView = true
                            }) {
                                SettingsRow(item: .init(title: "Reminder Sound", icon: .icRemind, detailText: "Default"))
                            }
                            .fullScreenCover(isPresented: $showReminderSoundView) {
                                ReminderSoundView()
                            }
                        }
                        
                        SettingsCard(title: "DATA & PRIVACY") {
                            HStack {
                                SettingsRow(item: .init(title: "iCloud Sync", icon: .icSync), showChevron: false)
                                
                                Spacer()
                                
                                Toggle("", isOn: Binding(
                                    get: { isCloudSyncEnabled },
                                    set: { newValue in
                                        if !newValue {
                                            showCloudSyncAlert = true
                                        } else {
                                            isCloudSyncEnabled = true
                                        }
                                    }
                                ))
                                .tint(primaryPink)
                                .labelsHidden()
                            }
                            .padding(.trailing, 8)
                            Divider()
                            Button(action: { showExportAlert = true }) {
                                SettingsRow(item: .init(title: "Export Data", icon: .icExport))
                            }
                            Divider()
                            Button(action: { showClearDataAlert = true }) {
                                SettingsRow(item: .init(title: "Clear All Data", icon: .icDelete, isDestructive: true))
                            }
                        }
                        
                        SettingsCard(title: "ABOUT") {
                            SettingsRow(item: .init(title: "Version", icon: .icVersion, detailText: "1.0.0"))
                            Divider()
                            Button(action: { showTOS = true }) {
                                SettingsRow(item: .init(title: "Terms of Service", icon: .icTos))
                            }
                            .fullScreenCover(isPresented: $showTOS) {
                                LegalView(
                                    title: "Terms of Service",
                                    content: AppConstants.Legal.termsContent
                                )
                            }
                            Divider()
                            Button(action: { showPrivacy = true }) {
                                SettingsRow(item: .init(title: "Privacy Policy", icon: .icPrivacy))
                            }
                            .fullScreenCover(isPresented: $showPrivacy) {
                                LegalView(
                                    title: "Privacy Policy",
                                    content: AppConstants.Legal.privacyContent
                                )
                            }
                            Divider()
                            Button(action: {
                                showRateAppAlert = true
                            }) {
                                SettingsRow(item: .init(title: "Rate the App", icon: .icStar))
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 100)
                }
                .background(backgroundPink.ignoresSafeArea())
                // Export data
                .alert("Export Your Data", isPresented: $showExportAlert) {
                    Button("Cancel", role: .cancel) { }
                    Button("Continue") {
                        prepareExportData()
                    }
                } message: {
                    Text("We'll generate a CSV of your cycles, symptoms, and notes that you can share or save to Files.")
                }
                // Clear data
                .alert("Clear All Data?", isPresented: $showClearDataAlert) {
                    Button("Cancel", role: .cancel) { }
                    Button("Clear All", role: .destructive) {
                        performClearData()
                    }
                } message: {
                    Text("This will permanently delete all your logged cycles, symptoms, and notes. This cannot be undone.")
                }
                // iCloud Sync Off
                .alert("Turn Off iCloud Sync?", isPresented: $showCloudSyncAlert) {
                    Button("Cancel", role: .cancel) { }
                    Button("Turn Off", role: .destructive) {
                        isCloudSyncEnabled = false
                    }
                } message: {
                    Text("Your data will stay on this device only. New entries will not sync to your other devices until you turn sync back on.")
                }
                
                Button(action: {
                    showRateAppAlert = true
                }) {
                    SettingsRow(item: .init(title: "Rate the App", icon: .icStar))
                }
                .sheet(item: $exportDoc) { doc in
                    ShareSheet(activityItems: [ShareMetadataSource(url: doc.url)])
                        .presentationDetents([.medium, .large])
                }
            }
            if showRateAppAlert {
                RateAppAlert(isPresented: $showRateAppAlert)
                    .transition(.opacity.combined(with: .scale))
            }
        }
        .setTabBarHidden(showRateAppAlert)
    }
    private func performClearData() {
        print("All user data deleted.")
    }
    private func requestAppReview() {
        if UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) is UIWindowScene {
        }
    }
    func prepareExportData() {
        let fileName = "GlowMoon-export-2026-04-24.csv"
        let path = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
        let csvContent = "Date,Cycle,Symptoms,Notes\n2026-04-24,14,Cramps,Feeling productive"
        
        do {
            try csvContent.write(to: path, atomically: true, encoding: .utf8)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.exportDoc = ExportDocument(url: path)
            }
        } catch {
            print("Export Error: \(error.localizedDescription)")
        }
    }
}

struct SettingsCard<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.leading, 5)
            
            VStack(spacing: 12) {
                content
            }
            .padding(16)
            .background(Color.white)
            .cornerRadius(18)
        }
    }
}
