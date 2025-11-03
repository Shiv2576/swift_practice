struct Person {
    let name: String
    let age: Int
}

protocol Ageable {
    var age: Int { get }
}

protocol Nameable {
    var name: String { get }
}

struct Student: Ageable, Nameable {
    let name: String
    let age: Int
    let grade: String
}

extension Ageable {
    func celebrateBirthday() -> Self {
        print("Happy birthday! Now \(age + 1) years old")
        return self
    }
}

var person = Person(name: "John", age: 25)
person = Person(name: "John", age: 26)

let guy = Student(name: "A", age: 25, grade: "F")
let some = guy.celebrateBirthday()
print(some)
