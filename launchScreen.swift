//
//  launchScreen.swift
//  StepToMile
//
//  Created by Bukhari Sani on 26/04/2023.
//
import SwiftUI

struct launchScreen: View {
    // Declare two state variables to control the animation
    // `isAnimating` is used to toggle the opacity of the text
    // `Offset` is used to control the vertical position of the text
    @State private var isAnimating = false
    @State private var Offset: CGFloat = -300
    
    var body: some View {
        // A ZStack is used to layer views on top of each other
        ZStack {
            // A black background color is added that ignores the safe area
            Color.black
                .ignoresSafeArea()
            // A text view is added that displays the title text
            Text("Omniv[r]²")
                .font(.custom("Noteworthy-Bold", size: 40))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .opacity(isAnimating ? 1 : 0)
                // The vertical position of the text is set based on the `Offset` state variable
                .offset(x: 0, y: Offset)
                // The `onAppear` modifier is used to trigger the animation when the view appears
                .onAppear {
                    // The `withAnimation` block animates the changes to `isAnimating` and `Offset`
                    // over a duration of 1.5 seconds with a delay of 0.5 seconds
                    withAnimation(.easeOut(duration: 1.5).delay(0.5)) {
                        isAnimating = true
                        Offset = 0
                }
            }
        }
    }
}
struct launchScreen_Previews: PreviewProvider {
    static var previews: some View {
       launchScreen()
    }
}

