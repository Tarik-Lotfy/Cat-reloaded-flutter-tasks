# WhatsApp Clone UI

A Flutter project that clones the WhatsApp UI based on the provided screenshots.

## Getting Started

This project contains the UI implementation of a WhatsApp clone with three screens:

- Chats
- Status
- Calls

## Adding Profile Images

The app currently uses placeholder text (first letter of names) in place of profile images. To add actual profile images:

1. Place your profile image assets in the `assets/images/` directory
2. Use naming conventions that match the user names, for example:

   - `martin_torff.png`
   - `alfonso_rhiel_madsen.png`
   - etc.

3. Then, update the `avatarUrl` properties in the data models found in `lib/models/data.dart` to point to your image assets:

```dart
ChatModel(
  name: "Martin Torff",
  message: "Let's Meet",
  time: "11:48",
  // Replace the comment with actual asset path
  avatarUrl: "assets/images/martin_torff.png",
  hasUnread: true,
  unreadCount: 123,
),
```

## Special Icons

Some special UI elements have icon placeholders:

- Call link icon (green circle with link icon)
- Status add button (green circle with plus icon)

These are implemented using built-in Flutter icons.

## Features to Implement Next

Future improvements could include:

- Chat details screen
- Message conversation screen
- Settings screen
- Dark mode support
- Notifications
