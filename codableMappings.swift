import Foundation

struct Person: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case name = "full_name"
    }
}

let jsonString = """
    {
      "user_id": 1,
      "full_name": "John Appleseed"
    }
    """

guard let jsonData = jsonString.data(using: .utf8) else {
    fatalError("cannot parse")
}

do {
    let person = try JSONDecoder().decode(Person.self, from: jsonData)
    print("Person : \(person.id) , name : \(person.name)")
} catch {
    print("Error decoding JSON: \(error)")
}
