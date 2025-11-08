import Foundation

let jsonresp = """
    {"id": 10, "title": "Swift Async Rocks"}
    """

struct User: Decodable {
    let id: Int
    let title: String
}

guard let jsonData = jsonresp.data(using: .utf8) else {
    fatalError("Cannot parse json data")
}

func jsonParse() async throws -> User {
    let data = try JSONDecoder().decode(User.self, from: jsonData)
    return data
}

Task {
    do {
        let user = try await jsonParse()
        print("Post id : \(user.id) , Title : \(user.title)")

    } catch {
        print(error)
    }
}
