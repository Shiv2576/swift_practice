import Foundation

actor DownloadManager {
    private var counter = 0

    func incrmnt() {
        counter += 1
    }

    func getCount() -> Int {
        return counter
    }
}

let manager = DownloadManager()

Task {
    await withTaskGroup(of: Void.self) { group in
        for i in 1...5 {
            group.addTask {
                await manager.incrmnt()
                print("Task \(i) incremented count")

            }
        }

        await group.waitForAll()
    }

    let finalCount = await manager.getCount()
    print("Final count: \(finalCount)")
}

Thread.sleep(forTimeInterval: 5)
