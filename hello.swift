let numbers = [1, 2, 3, 4, 5]

let squared = numbers.map { $0 * $0 }

print(squared)

let stringMap = numbers.map { "Numbers\($0)" }

print(stringMap)

let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers)

let sum = numbers.reduce(0) { $0 + $1 }
print(sum)
