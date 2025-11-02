import Foundation

struct User: Decodable {
    let id: Int
    let name: String
}

let jsonString = """
    [
      {"id": 1, "name": "Alice"},
      {"id": 2, "name": "Bob"}
    ]
    """

guard let jsonData = jsonString.data(using: .utf8) else {
    fatalError("Cannot parse json data")
}

do {
    let users = try JSONDecoder().decode([User].self, from: jsonData)

    for user in users {
        print("id : \(user.id) , name : \(user.name)")
    }
} catch {
    print("Error decoding JSON: \(error)")
}
