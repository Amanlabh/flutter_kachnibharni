import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Dummy data
      itemBuilder: (context, index) {
        return PostItem(index: index);
      },
    );
  }
}

class PostItem extends StatefulWidget {
  final int index;

  const PostItem({super.key, required this.index});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  int likeCount = 0; // Keep track of likes
  int commentCount = 0; // Keep track of comments
  bool isLiked = false; // Track if the post is liked by the user

  void _likePost() {
    setState(() {
      if (isLiked) {
        likeCount--; // Unlike post if already liked
      } else {
        likeCount++; // Like post
      }
      isLiked = !isLiked;
    });
  }

  void _addComment() {
    setState(() {
      commentCount++; // Increment comment count
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Random image of art from picsum.photos for demonstration
          Image.network(
            'https://picsum.photos/seed/${widget.index}/400/300', // Random image based on index
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
                  "Post Title ${widget.index}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "This is the description of post ${widget.index}",
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : Colors.grey,
                          ),
                          onPressed: _likePost,
                        ),
                        Text('$likeCount'),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.comment),
                          onPressed: _addComment,
                        ),
                        Text('$commentCount'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
