import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/providers/post_provider.dart';
import 'package:social/styles/textstyles.dart';
import 'package:social/widgets/post/post_component.dart';
import 'package:social/widgets/post/post_placeholder.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Future? fetchData;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    fetchData = Provider.of<PostProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, provider, _) {
        return FutureBuilder<void>(
          future: fetchData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Flutter social app'),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var x in provider.posts)
                        PostComponent(
                            post: x, index: provider.posts.indexOf(x)),
                      GestureDetector(
                        onTap: () async {
                          provider.toggleLoading();
                          await provider.fetchData(
                              lastId: provider.posts.last.postId);
                          provider.toggleLoading();
                        },
                        child: SizedBox(
                            height: 100,
                            child: Center(
                                child: provider.isLoading!
                                    ? const CircularProgressIndicator()
                                    : const Text('Load more',
                                        style: lightBlueText))),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Flutter social app'),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < 10; i++) const PostPlaceholder()
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
