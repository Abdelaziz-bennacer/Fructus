//
//  OnboardingView.swift
//  Fructus
//
//  Created by Abdelaziz Bennacer on 08/05/2024.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    let fruits: [Fruit] = fruitsData
    //@Binding var isOnboarding: Bool
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(fruits[0...5].shuffled()) { item in
                //FruitCardView(isOnboarding: $isOnboarding, fruit: item)
                FruitCardView(fruit: item)
                //Text("Cards")
            } //: LOOP
        } //: TABVIEW
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW
#Preview {
    //OnboardingView(isOnboarding: .constant(true))
    OnboardingView()
}
