//
//  FructusApp.swift
//  Fructus
//
//  Created by Abdelaziz Bennacer on 08/05/2024.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    //@State private var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding == true {
                //OnboardingView(isOnboarding: $isOnboarding)
                OnboardingView()
            } else {
                //ContentView(isOnboarding: $isOnboarding)
                ContentView()
            }
        }
    }
}
