import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/providers/post_provider.dart';
import 'package:social/widgets/post/post_component.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter social app'),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              for (int i = 0; i < provider.posts.length; i++)
                PostComponent(post: provider.posts[i], index: i)
            ]),
          ),
        );
      },
    );
  }
}
