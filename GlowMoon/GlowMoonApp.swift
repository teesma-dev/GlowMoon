//
//  GlowMoonApp.swift
//  GlowMoon
//
//  Created by Teesma M on 21/04/26.
//

import SwiftUI

@main
struct GlowMoonApp: App {
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                MainTabView()
            } else {
                NavigationStack {
                    OnboardingWelcomeView()
                }
            }
        }
    }
}
