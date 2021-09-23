import 'package:flutter/material.dart';
import 'package:hashtagable/hashtagable.dart';
import 'package:provider/provider.dart';
import 'package:social/models/post.dart';
import 'package:social/providers/post_provider.dart';
import 'package:social/styles/texts.dart';
import 'package:social/styles/textstyles.dart';
import 'package:social/widgets/post/comment_button_component.dart';
import 'package:social/widgets/post/icon_component.dart';

class PostComponent extends StatelessWidget {
  const PostComponent({Key? key, this.post, this.index}) : super(key: key);

  final Post? post;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, provider, _) {
      return SizedBox(
        height: 500,
        child: Card(
          elevation: 6.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          foregroundImage: AssetImage('assets/person.jpg'),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Komol Kuchkarov', style: darkText),
                            Text('@Komol', style: lightText),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              '2 weeks ago',
                              style: lightText,
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Hero(
                    tag: 'index: $index - post-to-comment',
                    child: Image.asset(
                      'assets/cat.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65.0,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Center(
                      child: Text(
                        detailText,
                        style: darkText,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.3,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: [
                        for (String hashtag in post!.hashtags!)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: HashTagText(
                              text: hashtag,
                              basicStyle: lightText,
                              decoratedStyle: lightBlueText,
                              maxLines: 1,
                              onTap: (value) => debugPrint(''),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          IconComponent(
                              index: index,
                              label: 'thumb',
                              outlineIcon: Icons.thumb_up_outlined,
                              filledIcon: Icons.thumb_up),
                          IconComponent(
                              index: index,
                              label: 'comment',
                              outlineIcon: Icons.comment_outlined,
                              filledIcon: Icons.comment),
                          Expanded(
                              child: CommentButtonComponent(
                                  post: post!,
                                  tag: 'index: $index - post-to-comment')),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
