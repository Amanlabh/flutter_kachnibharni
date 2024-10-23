import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String username;
  final String bio;
  final String profileImageUrl;
  final List<String> connections;
  final List<String> posts;

  const UserProfilePage({
    Key? key,
    required this.username,
    required this.bio,
    required this.profileImageUrl,
    required this.connections,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(bio),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Connections',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: connections.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 30,
                          child: Text(connections[index][0]),
                        ),
                        const SizedBox(height: 8),
                        Text(connections[index]),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Posts',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
