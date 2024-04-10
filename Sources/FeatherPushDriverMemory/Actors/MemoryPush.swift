//
//  MemoryPush.swift
//  FeatherPushDriverMemory
//
//  Created by Tibor Bodecs on 19/11/2023.
//

import FeatherPush

final actor MemoryPush {

    /// notification list
    var notifications: [(Notification, [Recipient])]

    init() {
        self.notifications = []
    }

    /// returns notification list
    func getNotifications() -> [(Notification, [Recipient])] {
        notifications
    }

    /// add one new notification to the notification list
    func add(_ notification: Notification, _ recipients: [Recipient]) {
        notifications.append((notification, recipients))
    }
}
