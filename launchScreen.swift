//
//  launchScreen.swift
//  StepToMile
//
//  Created by Bukhari Sani on 26/04/2023.
//
import SwiftUI

struct launchScreen: View {
    @State private var isAnimating = false
    @State private var yOffset: CGFloat = -300
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Text("Omniv[r]²")
                .font(.custom("Noteworthy-Bold", size: 40))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .opacity(isAnimating ? 1 : 0)
                .offset(x: 0, y: yOffset)
                .onAppear {
                    withAnimation(.easeOut(duration: 1.5).delay(0.5)) {
                        isAnimating = true
                        yOffset = 0
                    }
                }
        }
    }
}
