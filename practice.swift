func fetchGreeting() async -> String {
    try! await Task.sleep(nanoseconds: 2_000_000_000)
    return "Hello from async world!"
}

Task {
    let greeting = await fetchGreeting()
    print(greeting)
}
