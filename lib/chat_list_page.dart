import 'package:flutter/material.dart';
import 'chat_detail_page.dart'; // Ensure this import is correct

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      body: ListView.builder(
        itemCount: 10, // Display 10 random chats
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://picsum.photos/seed/$index/200/200', // Random profile image
              ),
            ),
            title: Text('User $index'), // Random user name
            subtitle: Text('Last message from user $index...'), // Chat preview
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(userName: 'User $index'), // Ensure this is correct
                ),
              );
            },
          );
        },
      ),
    );
  }
}
