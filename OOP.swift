class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func HappyBirthday() {
        age += 1
        print("Happy \(age)th Birthday")
    }
}

class Student: Person {
    var grade: String

    init(name: String, age: Int, grade: String) {
        self.grade = grade
        super.init(name: name, age: age)
    }
}

let person = Person(name: "Allen", age: 25)
person.HappyBirthday()
print(person.age)
