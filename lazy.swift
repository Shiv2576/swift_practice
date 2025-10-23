let bigArray = Array(1...10000)

let lazyTransformed = bigArray.lazy
    .filter { $0 % 2 == 0 }
    .map { $0 * $0 }

print(Array(lazyTransformed.prefix(5)))
// Output: [4, 16, 36, 64, 100] - Clean and readable!
