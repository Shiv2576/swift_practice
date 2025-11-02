import Foundation

func fetchFromApi(id: Int) async -> String {

    let delay = Double.random(in: 0.5...2.0)

    try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))

    return ("Response \(id)")
}

func fetchAllApis() async {
    await withTaskGroup(of: String.self) { group in
        for i in 1...3 {
            group.addTask {
                await fetchFromApi(id: i)
            }
        }

        for await response in group {
            print(response)
        }
    }
}

Task {
    await fetchAllApis()
}

Thread.sleep(forTimeInterval: 3)
