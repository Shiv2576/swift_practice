import Foundation

struct User {
    let id: String
    let value: String
}

func fetchUser() async -> User {
    try? await Task.sleep(nanoseconds: 20_000_000)
    return User(id: "1", value: "John")
}

func fetchPosts() async -> [String] {
    try? await Task.sleep(nanoseconds: 30_000_000)
    return ["Swift", "Concurrency"]
}

struct AppData {
    let user: User
    let posts: [String]
}

@main
struct Main {
    static func main() async {
        async let user = fetchUser()
        async let posts = fetchPosts()

        let appData = await AppData(user: user, posts: posts)
        print("User fetched: \(appData.user.value)")
        print("Posts fetched: \(appData.posts)")
    }
}
