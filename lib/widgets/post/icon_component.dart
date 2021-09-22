import 'package:flutter/material.dart';

class IconComponent extends StatelessWidget {
  const IconComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          IconButton(
            onPressed: () => debugPrint('hello'),
            icon: Icon(Icons.thumb_up_outlined),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Center(
              child: Text('17'),
            ),
          )
        ],
      ),
    );
  }
}
