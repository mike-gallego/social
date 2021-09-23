import 'package:flutter/material.dart';
import 'package:social/styles/textstyles.dart';

class CommentComponent extends StatelessWidget {
  const CommentComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5.0,
              offset: Offset(0.0, 0.75),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  bottom: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      'This cat is amazing!!!',
                      maxLines: 1,
                      style: commentText,
                    )),
                    Text('- Barbara Santiago', style: commentAuthor)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: IconButton(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 4.0),
                  onPressed: () => debugPrint('report'),
                  icon: const Icon(Icons.more_horiz)),
            )
          ],
        ),
      ),
    );
  }
}
