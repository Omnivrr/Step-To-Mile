//
//  StepToMileApp.swift
//  StepToMile
//
//  Created by Bukhari Sani on 24/04/2023.
//

import SwiftUI

@main
struct StepToMileApp: App {
    @State private var showMainView = false
    
    var body: some Scene {
        WindowGroup {
            if showMainView {
                ContentView()
            } else {
                launchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            showMainView = true
                        }
                    }
            }
        }
    }
}
