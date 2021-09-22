import 'package:flutter/material.dart';
import 'package:social/styles/textstyles.dart';

class CommentComponent extends StatelessWidget {
  const CommentComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        child: Center(
          child: Text('Comment about this', style: buttonText),
        ),
      ),
    );
  }
}
