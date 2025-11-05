protocol MessageClient {
    func sendMessage(to recipient: String, message: String) async throws
}

class EmailClient: MessageClient {

    func sendMessage(to recipient: String, message: String) async throws {
        print("📧 Sending email to \(recipient): \(message)")
    }
}

class SMSClient: MessageClient {
    func sendMessage(to recipient: String, message: String) async throws {
        print("🔔 Sending push to \(recipient): \(message)")
    }
}

class NotificationService {
    private let messageClient: MessageClient

    init(messageClient: MessageClient) {
        self.messageClient = messageClient
    }

    func sendnotification(to user: String, content: String) async {
        do {
            try await messageClient.sendMessage(to: user, message: content)
            print("✅ Notification sent successfully to \(user)")
        } catch {
            print("❌ Failed to send notification: \(error)")
        }
    }
}
