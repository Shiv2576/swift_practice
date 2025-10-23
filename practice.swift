struct User {
    let name: String
    let favoriteNumbers: [Int]
}

let users = [
    User(name: "A", favoriteNumbers: [1, 2]),
    User(name: "B", favoriteNumbers: [3, 4, 5]),
    User(name: "C", favoriteNumbers: []),
]

var allnumb: [Int] = []

func average(Array i: [Int], Length n: Int) -> Int {
    let sum = i.reduce(0, +)
    let Average = sum / n
    return Average
}

for i in users {
    for j in i.favoriteNumbers {
        allnumb.append(j)
    }
}

print(allnumb)
print(Set(allnumb))

print(average(Array: allnumb, Length: allnumb.count))
