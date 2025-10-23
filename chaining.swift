let numbers = [1, 2, 3, 4, 5, 6]

let filtered = numbers.filter { $0 % 2 == 0 }.map { $0 * $0 }.reduce(1, *)
print(filtered)
