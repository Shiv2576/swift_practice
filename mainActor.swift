import Foundation

@MainActor
func updateUI() async -> String {
    return "Running on main thread: true"
}

// Create the task and explicitly wait
let task = Task {
    await updateUI()
}

// Wait a bit and then get the result
// Thread.sleep(forTimeInterval: 1)
if let result = try? await task.result.get() {
    print(result)
} else {
    print("Task didn't complete")
}
