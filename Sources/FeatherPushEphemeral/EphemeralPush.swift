//
//  EphemeralPush.swift
//  feather-push-ephemeral
//
//  Created by Binary Birds on 2026. 08. 14.

import FeatherPush

/// An in-memory, actor-isolated push store used for testing and development.
///
/// Notifications are retained in insertion order together with their topics
/// and are not persisted.
public actor EphemeralPush {

    /// Creates an empty in-memory push store.
    public init() {}

    /// Captured notifications and their topics in insertion order.
    private var notifications: [(PushNotification, String)] = []

    /// Returns a snapshot of all captured notifications.
    func getNotifications() -> [(PushNotification, String)] {
        notifications
    }

    /// Stores a notification for a topic.
    func add(_ notification: PushNotification, topic: String) {
        notifications.append((notification, topic))
    }

    /// Removes all captured notifications.
    func clear() {
        notifications.removeAll()
    }
}
