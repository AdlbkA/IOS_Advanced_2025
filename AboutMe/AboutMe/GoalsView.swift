import SwiftUI

struct GoalsView: View {
    private let goals: [String] = [
        "Find job as a software developer",
        "Constanty develop my skills, learn new technologies",
        "Become a tech lead in a large tech company",
        "Launch my own startup"
    ]
    var body: some View {
        VStack{
            NavigationStack{
                List() {
                    ForEach(goals.indices, id : \.self) {
                        goal in VStack {
                            Text("\(goal + 1). \(goals[goal])")
                        }
                    }
                }
                .navigationTitle("Goals 💡")
            }
        }
        Spacer()
    }
}

#Preview {
    GoalsView()
}
