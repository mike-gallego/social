import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostPlaceholder extends StatelessWidget {
  const PostPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: Card(
            elevation: 6.0,
            child: Shimmer.fromColors(
                child: const SizedBox.expand(),
                baseColor: Colors.grey.withOpacity(0.4),
                highlightColor: Colors.white.withOpacity(0.3))));
  }
}
