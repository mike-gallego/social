import 'package:flutter/material.dart';
import 'package:social/models/post.dart';
import 'package:social/screens/comment_screen.dart';
import 'package:social/styles/textstyles.dart';

class CommentButtonComponent extends StatelessWidget {
  const CommentButtonComponent({Key? key, this.post, this.tag})
      : super(key: key);

  final Post? post;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CommentScreen(post: post!, tag: tag!))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: const BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5.0,
              offset: Offset(0.0, 0.75),
            )
          ],
        ),
        child: const Center(
          child: Text('Comment', style: buttonText),
        ),
      ),
    );
  }
}
