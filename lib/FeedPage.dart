import 'package:flutter/material.dart';
import 'dart:math';

// Sample Feed Page with Instagram-like Feed
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // Number of posts
        itemBuilder: (context, index) {
          return PostCard(
            imageUrl: 'https://picsum.photos/500?random=${index + 1}',
            username: 'user$index',
            caption: 'This is a sample caption for post $index',
          );
        },
      ),
    );
  }
}

// Reusable PostCard widget to represent each Instagram-like post
class PostCard extends StatefulWidget {
  final String imageUrl;
  final String username;
  final String caption;

  const PostCard({
    super.key,
    required this.imageUrl,
    required this.username,
    required this.caption,
  });

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.imageUrl),
            ),
            title: Text(widget.username, style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.more_vert),
          ),
          Image.network(widget.imageUrl, fit: BoxFit.cover, height: 300, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const Icon(Icons.comment),
                const SizedBox(width: 8),
                const Icon(Icons.share),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(widget.caption),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'View all comments',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
