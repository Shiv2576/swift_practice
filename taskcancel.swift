import Foundation

func startCount() async throws {
    for i in 1...10 {

        try Task.checkCancellation()

        print("Counting  : \(i)")

        try await Task.sleep(nanoseconds: 1_000_000_000)
    }

    print("Counting completed!")

}

let countingTask = Task {
    do {
        try await startCount()
    } catch {
        if Task.isCancelled {
            print("Task Cancelled")
        } else {
            print("Error : \(error)")
        }
    }
}

Task {
    try await Task.sleep(nanoseconds: 3_000_000_000)
    countingTask.cancel()
}
Thread.sleep(forTimeInterval: 5)
