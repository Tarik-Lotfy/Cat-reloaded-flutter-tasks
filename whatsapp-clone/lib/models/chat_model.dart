class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool isRead;
  final bool hasUnread;
  final int? unreadCount;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    this.isRead = true,
    this.hasUnread = false,
    this.unreadCount,
  });
}

class StatusModel {
  final String name;
  final String time;
  final String avatarUrl;

  StatusModel({
    required this.name,
    required this.time,
    required this.avatarUrl,
  });
}

class CallModel {
  final String name;
  final String time;
  final String avatarUrl;
  final bool isVideo;
  final bool isIncoming;
  final bool isMissed;

  CallModel({
    required this.name,
    required this.time,
    required this.avatarUrl,
    this.isVideo = false,
    this.isIncoming = true,
    this.isMissed = false,
  });
}
