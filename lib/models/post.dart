import 'package:social/models/user.dart';

class Post {
  final User? user;
  final String? postId;
  final String? imgPath;
  final String? caption;
  final List<String>? hashtags;
  int? likes;
  int? comments;
  bool? liked;
  bool? commented;

  Post({
    this.user,
    this.postId,
    this.imgPath,
    this.caption,
    this.hashtags,
    this.likes,
    this.comments,
    this.liked,
    this.commented,
  });
}
