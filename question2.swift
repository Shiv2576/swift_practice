import Foundation

struct Post: Decodable {
    let id: Int
    let title: String
}

func fetchPost() async throws -> [Post] {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    let (Data, _) = try await URLSession.shared.data(from: url)
    let posts = try JSONDecoder().decode([Post].self, from: Data)

    return posts

}

Task {
    do {
        let post = try await fetchPost()
        print(post.count)
    } catch {
        print(error)
    }
}

Thread.sleep(forTimeInterval: 5)
