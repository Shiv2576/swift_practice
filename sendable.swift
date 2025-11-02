import Foundation

struct UserProfile: Sendable {
    var name: String
    var age: Int
}

actor ProfileManager {

    private var profile: UserProfile

    init(profile: UserProfile) {
        self.profile = profile
    }

    func updateProfile(name: String? = nil, age: Int? = nil) {
        if let name = name {
            profile.name = name
        }

        if let age = age {
            profile.age = age
        }

        print("Profile updated :  \(profile.name) , \(profile.age)")
    }

    func getProfile() -> UserProfile {
        return profile
    }

    func printProfile() {
        print("Current profile: \(profile.name), \(profile.age)")
    }
}

let initialProfile = UserProfile(name: "Alice", age: 25)
let profileManager = ProfileManager(profile: initialProfile)

Task {
    print("Starting Concurrent Tasks.")

    await withTaskGroup(of: Void.self) { group in
        group.addTask {
            for i in 1...3 {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                await profileManager.updateProfile(name: "User\(i)", age: i + 25)

            }

        }

        group.addTask {
            for _ in 1...4 {
                try? await Task.sleep(nanoseconds: 150_000_000)
                let profile = await profileManager.getProfile()
                print("Read Profile : \(profile.name) , \(profile.age)")
            }
        }

    }
    print("\nFinal state:")
    await profileManager.printProfile()
}

Thread.sleep(forTimeInterval: 5)
