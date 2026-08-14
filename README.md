# Feather Push Ephemeral

An in-memory push client for Feather Push, intended for tests and local development.

[![Release: 1.0.0-beta.1](https://img.shields.io/badge/Release-1%2E0%2E0--beta%2E1-F05138)](https://github.com/feather-framework/feather-push-ephemeral/releases/tag/1.0.0-beta.1)

## Features

- In-memory `PushClient` implementation
- Topic-based notification capture
- Useful for tests and local development
- Swift 6 concurrency support

## Requirements

![Swift 6.1+](https://img.shields.io/badge/Swift-6%2E1%2B-F05138)
![Platforms: Linux, macOS, iOS, tvOS, watchOS, visionOS](https://img.shields.io/badge/Platforms-Linux_%7C_macOS_%7C_iOS_%7C_tvOS_%7C_watchOS_%7C_visionOS-F05138)

- Swift 6.1+
- Platforms:
  - Linux
  - macOS 15+
  - iOS 18+
  - tvOS 18+
  - watchOS 11+
  - visionOS 2+

## Installation

Use Swift Package Manager; add the dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/feather-framework/feather-push-ephemeral", exact: "1.0.0-beta.1"),
```

Then add `FeatherPushEphemeral` to your target dependencies:

```swift
.product(name: "FeatherPushEphemeral", package: "feather-push-ephemeral"),
```

## Usage

```swift
let client = PushClientEphemeral()
let notification = PushNotification(
    title: "New message",
    body: "You have a new message."
)

try await client.send(notification: notification, to: "messages")
let captured = await client.getNotifications()
```

> [!WARNING]
> This repository is a work in progress, things can break until it reaches v1.0.0.

## Development

- Build: `swift build`
- Test: `make test`
- Format: `make format`
- Check: `make check`

## Contributing

[Pull requests](https://github.com/feather-framework/feather-push-ephemeral/pulls) are welcome. Please keep changes focused and include tests for new logic.
