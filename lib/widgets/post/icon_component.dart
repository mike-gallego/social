import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/providers/post_provider.dart';

class IconComponent extends StatelessWidget {
  const IconComponent(
      {Key? key, this.index, this.label, this.outlineIcon, this.filledIcon})
      : super(key: key);

  final int? index;
  final String? label;
  final IconData? outlineIcon;
  final IconData? filledIcon;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, provider, _) {
        return SizedBox(
          height: 50,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<PostProvider>(context, listen: false)
                      .pressIcon(index: index!, label: label!);
                },
                icon: provider.posts[index!].liked!
                    ? Icon(outlineIcon)
                    : Icon(filledIcon),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                child: const Center(
                  child: Text('17'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
