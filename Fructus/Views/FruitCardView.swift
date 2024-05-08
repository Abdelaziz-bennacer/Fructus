//
//  FruitCardView.swift
//  Fructus
//
//  Created by Abdelaziz Bennacer on 08/05/2024.
//

import SwiftUI

struct FruitCardView: View {
    // MARK: - PROPERTIES
    @State private var isAnimating: Bool = false
    //@Binding var isOnboarding: Bool
    
    var fruit: Fruit
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                // FRUIT: IMAGE
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                
                // FRUIT: TITLE
                Text(fruit.title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2, x: 2, y: 2)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                // FRUIT: HEADLINE
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                // BUTTON: START
                //StartButtonView(isOnboarding: $isOnboarding)
                StartButtonView()
            } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        })
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(
                LinearGradient(
                    gradient: Gradient(colors: fruit.gradientColors),
                    startPoint: .top,
                    endPoint: .bottom
                )
        )
        .cornerRadius(20)
        //.ignoresSafeArea(.all, edges: .all)
        .padding(.horizontal, 20)
        
    }
}

// MARK: - PREVIEW
#Preview {
    //FruitCardView(isOnboarding: .constant(true), fruit: fruitsData[1])
    FruitCardView(fruit: fruitsData[1])
        .previewLayout(.fixed(width: 320, height: 640))
}
