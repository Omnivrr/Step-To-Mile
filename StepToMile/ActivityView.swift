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
                    var newActiviity = activity
                    newActiviity.completionCount += 1
                    
                    if let index = data.activities.firstIndex(of: activity) {
                        data.activities[index] = newActiviity
                        
                    }
                    
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
