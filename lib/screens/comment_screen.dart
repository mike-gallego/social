import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/models/post.dart';
import 'package:social/providers/post_provider.dart';
import 'package:social/styles/textstyles.dart';
import 'package:social/widgets/comment/comment_component.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({Key? key, this.tag, this.post, this.index})
      : super(key: key);

  final String? tag;
  final Post? post;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                collapsedHeight: 150,
                expandedHeight: 300,
                flexibleSpace: SizedBox.expand(
                  child: Hero(
                    tag:
                        'Index: ${index.toString()}, ID: ${post!.postId} - post-to-comment',
                    child: Image.asset(
                      post!.imgPath!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(post!.caption!, style: darkText),
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                indent: 16.0,
                                endIndent: 16.0,
                                thickness: 1.0,
                              ),
                            ),
                            Text('Comments', style: commentHeading),
                            const Expanded(
                              child: Divider(
                                indent: 16.0,
                                endIndent: 16.0,
                                thickness: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var comment in post!.comments!)
                              CommentComponent(comment: comment)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 75,
                      color: Colors.lightBlueAccent.withOpacity(.7),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 16.0,
                                  top: 8.0,
                                  left: 16.0,
                                  right: 8.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: TextField(
                                  controller: provider.controller,
                                  focusNode: provider.inputNode,
                                  autofocus: true,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: double.infinity,
                            child: IconButton(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              icon: const Icon(Icons.send),
                              onPressed: () async {
                                await provider.addComment(
                                    post: post!, context: context);
                              },
                            ),
                          ),
                        ],
                      ),
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
