/*
Closures : a group of code that can be executed without having a named func.
*/

let closureAdd = { (a: Int, b: Int) in a + b }
print(closureAdd(5, 3))

/*
Curried Func : it transforms a function that takes multiple parameters in a series of function which takes single parameter.
*/

func addCurried(_ a: Int) -> (Int) -> Int {
    return { b in
        a + b
    }
}

let sum = addCurried(3)
let total = sum(5)
print(total)
