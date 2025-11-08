import Foundation

func FetchGreetings() async throws -> String {
    return ("HEllO")
}

Task {
    try await Task.sleep(nanoseconds: 2_000_000_000)
    let greet = try await FetchGreetings()
    print(greet)
}

Thread.sleep(forTimeInterval: 5)
