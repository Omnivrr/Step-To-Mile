import SwiftUI

struct ContentView: View {
    // Create an instance of the Activities class using @StateObject
    @StateObject var data = Activities()
    
    // Declare a state variable to keep track of whether the "Add new activity" sheet should be shown
    @State private var addingNewActivity = false
    
    var body: some View {
        // Embed the view in a NavigationView to enable navigation
        NavigationView {
            // Display a list of activities
            List(data.activities) { activity in
                // When an activity is tapped, navigate to a detailed view of the activity
                NavigationLink {
                    ActivityView(data: data, activity: activity)
                } label: {
                    // Display the title of the activity along with a colored capsule showing the number of times it has been completed
                    HStack {
                        Text(activity.title)
                        Spacer()
                        Text(String(activity.completionCount))
                            .font(.caption.weight(.black))
                            .padding(5)
                            .frame(minWidth: 50)
                            .background(color(for: activity))
                            .clipShape(Capsule())
                    }
                }
            }
            // Set the navigation title to "Step To Mile"
            .navigationTitle("Step To Mile")
            // Add a toolbar with a button to add new activities
            .toolbar {
                Button {
                    addingNewActivity.toggle()
                } label: {
                    Label ("Add new activity", systemImage: "plus")
                        .background(Color.black)
                }
            }
            // Present a sheet to add new activities when the "Add new activity" button is tapped
            .sheet(isPresented: $addingNewActivity) {
                AddActivity(data: data)
            }
            // Set the background of the view to a gradient
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple, Color.red]),
                    startPoint: .top,
                    endPoint: .bottom))
        }
    }
    
    // Helper function to determine the color of the completion count capsule based on the number of times the activity has been completed
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
            return .red
        } else if activity.completionCount < 10 {
            return .orange
        } else if activity.completionCount < 20 {
            return .green
        } else if activity.completionCount < 50 {
            return .blue
        } else {
            return .indigo
        }
    }
}

// Preview the ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
