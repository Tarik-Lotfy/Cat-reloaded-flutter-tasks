import 'package:flutter/material.dart';
import '../models/data.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: statusData.length,
        itemBuilder: (context, index) {
          final status = statusData[index];

          // My Status item is different from the rest
          if (index == 0) {
            return ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(status.avatarUrl),
                    radius: 25,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                status.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                status.time,
                style: const TextStyle(color: Colors.grey),
              ),
            );
          }

          // Recent Updates heading
          if (index == 1) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                  child: Text(
                    "Recent Updates",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // The actual status item
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.teal, width: 2),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(status.avatarUrl),
                      radius: 25,
                    ),
                  ),
                  title: Text(
                    status.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    status.time,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            );
          }

          // Regular status items
          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.teal, width: 2),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(status.avatarUrl),
                radius: 25,
              ),
            ),
            title: Text(
              status.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              status.time,
              style: const TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Edit button (smaller)
          SizedBox(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.grey.shade200,
              heroTag: "edit_status",
              child: const Icon(Icons.edit, color: Colors.teal, size: 20),
            ),
          ),
          const SizedBox(height: 16),
          // Camera button (larger)
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.teal,
            heroTag: "camera_status",
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
