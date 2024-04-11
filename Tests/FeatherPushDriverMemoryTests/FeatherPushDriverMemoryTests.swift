//
//  FeatherPushDriverMemoryTests.swift
//  FeatherPushDriverMemoryTests
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import Foundation
import XCTest
import FeatherComponent
import FeatherPush
import FeatherPushDriverMemory
import XCTFeatherPush

final class FeatherPushDriverMemoryTests: XCTestCase {

    func testMemoryDriverUsingTestSuite() async throws {
        do {
            let registry = ComponentRegistry()
            try await registry.addPush(MemoryPushComponentContext())

            let push = try await registry.push()

            do {
                try await push.send(
                    notification: .init(
                        title: "title",
                        body: "body"
                    ),
                    to: [
                        .init(
                            token: "token",
                            platform: .android
                        )
                    ]
                )

                let memoryPush = push as! MemoryPushComponent
                let notifications = await memoryPush.getNotifications()
                XCTAssertFalse(notifications.isEmpty)

            }
            catch {
                throw error
            }
        }
        catch {
            XCTFail("\(error)")
        }

    }

}
