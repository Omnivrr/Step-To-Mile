//
//  ActivityView.swift
//  StepToMile
//
//  Created by Bukhari Sani on 26/04/2023.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var data: Activities
    var activity: Activity
    
    var body: some View {
        List {
            Section {
                if activity.description.isEmpty == false {
                    Text(activity.description)
                }
            }
            Section {
                Text("Completion count: \(activity.completionCount)")
                
                Button("Mark Completed") {
                    
                }
            }
        }
        .navigationTitle((activity.title))
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(data: Activities(), activity: Activity.example)
    }
}
