import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/providers/post_provider.dart';
import 'package:social/styles/menu_items.dart';
import 'package:social/styles/textstyles.dart';

class CommentComponent extends StatelessWidget {
  const CommentComponent({Key? key, this.comment}) : super(key: key);

  final String? comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 2.0,
              offset: Offset(0.0, 0.75),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(comment!, style: commentText),
              ),
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Center(
                        child: Text('- Barbara Santiago', style: commentAuthor),
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.more_horiz),
                    itemBuilder: (context) {
                      return menu
                          .map((e) => PopupMenuItem(child: Text(e)))
                          .toList();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
