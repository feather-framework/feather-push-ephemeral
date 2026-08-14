//
//  PushClientEphemeral.swift
//  feather-push-ephemeral
//
//  Created by Binary Birds on 2026. 08. 14.

import FeatherPush

/// An in-memory push client implementation.
///
/// `PushClientEphemeral` conforms to `PushClient` and captures notifications
/// in an actor-isolated `EphemeralPush` instance. It is intended for testing,
/// previews, and local development without contacting a push provider.
public struct PushClientEphemeral: Sendable {

    /// The underlying in-memory push store.
    private let ephemeralPush: EphemeralPush

    /// Creates a new in-memory push client.
    ///
    /// - Parameter ephemeralPush: The push store used for captured
    ///   notifications. Defaults to a new `EphemeralPush` instance.
    public init(ephemeralPush: EphemeralPush = EphemeralPush()) {
        self.ephemeralPush = ephemeralPush
    }
}

extension PushClientEphemeral: PushClient {

    /// Returns all notifications captured by this client and their topics.
    public func getNotifications() async -> [(PushNotification, String)] {
        await ephemeralPush.getNotifications()
    }

    /// Captures a notification for the supplied topic.
    public func send(
        notification: PushNotification,
        to topic: String
    ) async throws(PushClientError) {
        guard !topic.isEmpty else {
            throw .invalidTopic
        }
        await ephemeralPush.add(notification, topic: topic)
    }
}

extension PushClientEphemeral {

    /// Removes all captured notifications.
    public func clearNotifications() async {
        await ephemeralPush.clear()
    }
}
