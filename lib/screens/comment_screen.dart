import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:social/models/post.dart';
import 'package:social/styles/textstyles.dart';
import 'package:social/widgets/comment/comment_component.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({Key? key, this.tag, this.post}) : super(key: key);

  final String? tag;
  final Post? post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: tag!,
                child: Image.asset(
                  post!.imgPath!,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(post!.caption!, style: darkText),
              ),
              Row(children: [
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
              ]),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(children: [
                  for (int i = 0; i < 10; i++) const CommentComponent()
                ])),
              ),
            ],
          ),
          ColorfulSafeArea(
            color: Colors.transparent,
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
