//
//  FeatherPushEphemeralTests.swift
//  feather-push-ephemeral
//
//  Created by Binary Birds on 2026. 08. 14.

import FeatherPush
import FeatherPushEphemeral
import Testing

@Suite
struct FeatherPushEphemeralTests {

    @Test
    func clientSendStoresNotification() async throws {
        let client = PushClientEphemeral()
        let notification = PushNotification(title: "title", body: "body")

        try await client.send(notification: notification, to: .topic("news"))

        let notifications = await client.getNotifications()
        #expect(notifications.count == 1)
        #expect(notifications[0].0.title == "title")
        #expect(notifications[0].1 == "news")
    }

    @Test
    func clientSendRejectsEmptyTopic() async {
        let client = PushClientEphemeral()

        do {
            try await client.send(
                notification: PushNotification(title: "title", body: "body"),
                to: .topic("")
            )
            Issue.record("Expected PushClientError.invalidTopic to be thrown.")
        }
        catch .invalidTopic {
            // Expected error.
        }
        catch {
            Issue.record("Unexpected error: \(error)")
        }
    }

    @Test
    func clientSendStoresDeviceToken() async throws {
        let client = PushClientEphemeral()

        try await client.send(
            notification: PushNotification(title: "title", body: "body"),
            to: .deviceToken("device-token")
        )

        let notifications = await client.getNotifications()
        #expect(notifications[0].1 == "device-token")
    }

    @Test
    func clientSendRejectsEmptyDeviceToken() async {
        let client = PushClientEphemeral()

        do {
            try await client.send(
                notification: PushNotification(title: "title", body: "body"),
                to: .deviceToken("")
            )
            Issue.record(
                "Expected PushClientError.invalidDeviceToken to be thrown."
            )
        }
        catch .invalidDeviceToken {
            // Expected error.
        }
        catch {
            Issue.record("Unexpected error: \(error)")
        }
    }

    @Test
    func clientClearNotificationsRemovesAll() async throws {
        let client = PushClientEphemeral()
        let notification = PushNotification(title: "title", body: "body")

        try await client.send(notification: notification, to: .topic("news"))
        await client.clearNotifications()

        let notifications = await client.getNotifications()
        #expect(notifications.isEmpty)
    }
}
