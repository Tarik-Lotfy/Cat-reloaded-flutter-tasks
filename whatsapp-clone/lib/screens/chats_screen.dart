import 'package:flutter/material.dart';
import '../models/data.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatData.length,
        itemBuilder: (context, index) {
          final chat = chatData[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chat.avatarUrl),
              radius: 25,
            ),
            title: Text(
              chat.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                // Check icon for read messages
                if (chat.isRead)
                  const Icon(Icons.check, size: 16, color: Colors.grey),

                const SizedBox(width: 3),

                // Message text
                Expanded(
                  child: Text(
                    chat.message,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Time
                Text(
                  chat.time,
                  style: TextStyle(
                    color: chat.hasUnread ? Colors.teal : Colors.grey,
                    fontSize: 12,
                  ),
                ),

                // Unread message count
                if (chat.hasUnread && chat.unreadCount != null)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chat.unreadCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}
