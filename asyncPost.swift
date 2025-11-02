import Foundation

struct NewPost: Codable {
    let title: String
    let body: String
}

// Function to send POST request
func sendPost() async {
    // Create a new post
    let newPost = NewPost(
        title: "My First Post",
        body: "This is the body of my post"
    )

    // Encode to JSON
    guard let jsonData = try? JSONEncoder().encode(newPost) else {
        print("Failed to encode post to JSON")
        return
    }

    // Print the JSON for verification
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print("JSON being sent: \(jsonString)")
    }

    // Create URL and request
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData

    do {
        // Send the request
        let (data, response) = try await URLSession.shared.data(for: request)

        // Check the response status
        if let httpResponse = response as? HTTPURLResponse {
            print("Response status: \(httpResponse.statusCode)")

            // Print the response body
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response body: \(responseString)")
            }
        }
    } catch {
        print("Request failed: \(error)")
    }
}

// Execute the function
Task {
    await sendPost()
}

// Keep the program alive
Thread.sleep(forTimeInterval: 5)
