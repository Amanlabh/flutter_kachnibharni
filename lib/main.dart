import 'package:flutter/material.dart';
import 'profile.dart'; // Import the profile.dart file
import 'stories.dart'; // Import the stories.dart file
import 'cart.dart'; // Import the cart.dart file
import 'bottom_button_bar.dart'; // Import the bottom_button_bar.dart file
import 'chat_list_page.dart'; // Corrected import to chat_list_page.dart

void main() {
  runApp(const SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Trigger the interest selection popup after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      _showInterestSelectionDialog();
    });
  }

  // Function to show the interest selection popup
  void _showInterestSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Your Interest"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Choose one or more interests:"),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: [
                  ChoiceChip(label: const Text("Madhubani painting"), selected: false),
                  ChoiceChip(label: const Text("Sculptures"), selected: false),
                  ChoiceChip(label: const Text("Oil"), selected: false),
                  ChoiceChip(label: const Text("Pop Art"), selected: false),
                  ChoiceChip(label: const Text("Abstract Art"), selected: false),
                  ChoiceChip(label: const Text("Gouache"), selected: false),
                  ChoiceChip(label: const Text("Acrylic Paint"), selected: false),
                  ChoiceChip(label: const Text("More"), selected: false),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Done"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("kachni bharni"),
        leading: GestureDetector(
          onTap: () {
            // Navigate to the ProfilePage when the profile icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150', // Replace with actual profile picture URL or asset
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              // Navigate to ChatListPage when the chat icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatListPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart), // Add cart icon
            onPressed: () {
              // Navigate to CartPage when the cart icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: const Column(
        children: [
          StoriesSection(), // Ensure this widget is correctly defined
          Expanded(child: PostList()), // Ensure PostList is correctly defined
        ],
      ),
      bottomNavigationBar: const BottomButtonBar(), // Add the custom BottomButtonBar
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Dummy data
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://via.placeholder.com/150', // Post image
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Post Title $index",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "This is the description of post $index",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
