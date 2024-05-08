//
//  ContentView.swift
//  Fructus
//
//  Created by Abdelaziz Bennacer on 08/05/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    //@Binding var isOnboarding: Bool
    var fruits: [Fruit] = fruitsData
    @State private var isShowingSettings: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled(), id: \.self.id) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing: 
                    Button(action:  {
                        isShowingSettings = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    } //: BUTTON
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                )
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
//        .onDisappear(perform: {
//           isOnboarding = true
//        })
    }
}

#Preview {
    //ContentView(isOnboarding: .constant(true))
    ContentView()
}
