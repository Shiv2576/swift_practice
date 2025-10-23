/*
MAP : this is basic transfromation of each element in a collection 1:1.
*/
let numbers = [1, 2, 3, 4, 5]
let sq = numbers.map { $0 * $0 }
print(sq)

/*
Flat Map : this  transforms and flatens a nested collection (removes level of nesting)
*/

let nest = [[1, 2], [3], [4, 5, 6]]
let flat = nest.flatMap { $0 }
print(flat)

/*
compact Map : this Transforms and automatically removes any nil values
*/

let noise = ["1", "2", "3", "string", "goo"]
let fit = noise.compactMap { String($0) }

print(fit)
