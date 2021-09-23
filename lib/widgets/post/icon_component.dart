import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/models/post.dart';
import 'package:social/providers/post_provider.dart';

class IconComponent extends StatelessWidget {
  const IconComponent(
      {Key? key, this.post, this.label, this.outlineIcon, this.filledIcon})
      : super(key: key);

  final Post? post;
  final String? label;
  final IconData? outlineIcon;
  final IconData? filledIcon;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, provider, _) {
        if (label == 'thumb') {
          return SizedBox(
            height: 50,
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    await Provider.of<PostProvider>(context, listen: false)
                        .pressIcon(label: label!, post: post!);
                  },
                  icon: !post!.liked!
                      ? Icon(outlineIcon)
                      : Icon(filledIcon, color: Colors.orangeAccent),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0))),
                  child: Center(
                    child: Text(post!.likes!.toString()),
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox(
            height: 50,
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {},
                  icon: !post!.commented!
                      ? Icon(outlineIcon)
                      : Icon(filledIcon, color: Colors.orangeAccent),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0))),
                  child: Center(
                    child: Text(post!.comments!.length.toString()),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
