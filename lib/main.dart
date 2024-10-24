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

  // Method to show the interest selection popup
  void _showInterestSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Your Interests'),
          content: const InterestSelection(), // Custom widget for interest selection
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Done'),
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

// Custom widget to display the list of interests
class InterestSelection extends StatefulWidget {
  const InterestSelection({super.key});

  @override
  _InterestSelectionState createState() => _InterestSelectionState();
}

class _InterestSelectionState extends State<InterestSelection> {
  // List of interests
  final List<String> interests = [
    'Madhubani painting',
    'Sculptures',
    'Oil',
    'Pop Art',
    'Abstract Art',
    'Gouache',
    'Acrylic Paint',
    'More'
  ];

  // To track selected interests
  final Map<String, bool> selectedInterests = {};

  @override
  void initState() {
    super.initState();
    // Initialize selectedInterests to false for all interests
    for (var interest in interests) {
      selectedInterests[interest] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: interests.map((interest) {
          return CheckboxListTile(
            title: Text(interest),
            value: selectedInterests[interest],
            onChanged: (bool? value) {
              setState(() {
                selectedInterests[interest] = value!;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

// The PostList widget remains unchanged
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
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
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
