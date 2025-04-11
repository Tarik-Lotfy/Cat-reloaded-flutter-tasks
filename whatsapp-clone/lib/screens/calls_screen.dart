import 'package:flutter/material.dart';
import '../models/data.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: callData.length,
        itemBuilder: (context, index) {
          final call = callData[index];

          // Special treatment for the "Create call link" item
          if (index == 0) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(call.avatarUrl),
                radius: 25,
              ),
              title: Text(
                call.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                call.time,
                style: const TextStyle(color: Colors.grey),
              ),
            );
          }

          // Recent heading if on second item
          if (index == 1) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                  child: Text(
                    "Recent",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // The actual call item
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(call.avatarUrl),
                    radius: 25,
                  ),
                  title: Text(
                    call.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: [
                      // Incoming or outgoing icon
                      Icon(
                        call.isIncoming ? Icons.call_received : Icons.call_made,
                        size: 16,
                        color: call.isMissed ? Colors.red : Colors.green,
                      ),
                      const SizedBox(width: 4),
                      // Time of call
                      Text(
                        call.time,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    call.isVideo ? Icons.videocam : Icons.call,
                    color: Colors.teal,
                  ),
                ),
              ],
            );
          }

          // Regular call items
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(call.avatarUrl),
              radius: 25,
            ),
            title: Text(
              call.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                // Incoming or outgoing icon
                Icon(
                  call.isIncoming ? Icons.call_received : Icons.call_made,
                  size: 16,
                  color: call.isMissed ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 4),
                // Time of call
                Text(call.time, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            trailing: Icon(
              call.isVideo ? Icons.videocam : Icons.call,
              color: Colors.teal,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add_call, color: Colors.white),
      ),
    );
  }
}
