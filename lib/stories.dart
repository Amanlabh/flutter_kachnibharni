import 'package:flutter/material.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Dummy data
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 80,
            child: Column(
              children: [
                // Replace CircleAvatar with a rectangular container
                Container(
                  width: 80,
                  height: 60, // Adjust height as needed
                  decoration: BoxDecoration(
                    color: Colors.blueAccent, // Background color for demonstration
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/200/300?random=$index', // Random image for demonstration
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text("Categories $index", style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}