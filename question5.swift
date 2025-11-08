import Foundation

func runConcurrentTasks() async {
    await withTaskGroup(of: Void.self) { group in
        for i in 1...3 {
            group.addTask {
                try? await Task.sleep(nanoseconds: UInt64(i) * 1_000_000_000)
                print("Task \(i) completed")
            }
        }

    }
    print("All Task Done")

}

Task {
    await runConcurrentTasks()
}

Thread.sleep(forTimeInterval: 5)
