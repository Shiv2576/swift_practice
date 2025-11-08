actor Counter {
    private var count = 0

    func inc() {
        count += 1
    }

    func getCount() -> Int {
        return count
    }

}

let user = Counter()

Task {
    await user.inc()
    print(await user.getCount())

}
