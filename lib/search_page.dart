import 'package:flutter/material.dart';
import 'user1.dart'; // Import UserProfilePage

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  
  // Dummy data for users
  final List<Map<String, dynamic>> _users = [
    {
      'username': 'User 1',
      'bio': 'Bio of User 1',
      'profileImageUrl': 'https://via.placeholder.com/150',
      'connections': ['User 2', 'User 3'],
      'posts': ['Post 1 by User 1', 'Post 2 by User 1'],
    },
    {
      'username': 'User 2',
      'bio': 'Bio of User 2',
      'profileImageUrl': 'https://via.placeholder.com/150',
      'connections': ['User 1', 'User 3'],
      'posts': ['Post 1 by User 2', 'Post 2 by User 2'],
    },
    {
      'username': 'User 3',
      'bio': 'Bio of User 3',
      'profileImageUrl': 'https://via.placeholder.com/150',
      'connections': ['User 1', 'User 2'],
      'posts': ['Post 1 by User 3', 'Post 2 by User 3'],
    },
    // Add more users as needed
  ];

  List<Map<String, dynamic>> _searchResults = [];

  void _searchUsers(String query) {
    final results = _users.where((user) {
      return user['username'].toLowerCase().contains(query.toLowerCase());
    }).toList();
    
    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Users'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _searchUsers(_searchController.text),
                ),
              ),
              onSubmitted: _searchUsers,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final user = _searchResults[index];
                return ListTile(
                  title: Text(user['username']),
                  onTap: () {
                    // Navigate to UserProfilePage with user details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfilePage(
                          username: user['username'],
                          bio: user['bio'],
                          profileImageUrl: user['profileImageUrl'],
                          connections: List<String>.from(user['connections']),
                          posts: List<String>.from(user['posts']),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
