protocol Animal {
    func Breath()
}

protocol Mammal {
    func Feedmilk()
}

protocol Bird {
    func fly()
}

extension Animal {
    func Breath() {
        print("Breathing")
    }
}

extension Mammal {
    func Feedmilk() {
        print("Feeding")
    }
}

extension Bird {
    func fly() {
        print("Flying")
    }
}

struct Bat: Animal, Mammal, Bird {
    func Fly() {
        print("Bat flying")
    }
}

let bat = Bat()

bat.Breath()
bat.Feedmilk()
bat.fly()
bat.Fly()
