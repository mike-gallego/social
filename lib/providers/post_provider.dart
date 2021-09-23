import 'package:flutter/material.dart';
import 'package:social/models/post.dart';
import 'package:social/models/user.dart';
import 'package:social/styles/texts.dart';
import 'package:uuid/uuid.dart';

class PostProvider extends ChangeNotifier {
  PostProvider() {
    _controller = TextEditingController();
    _inputNode = FocusNode();
  }

  late TextEditingController _controller;
  TextEditingController get controller => _controller;

  late FocusNode _inputNode;
  FocusNode get inputNode => _inputNode;

  final Map<String, int> _counters = {
    'thumb': 17,
  };

  final Map<String, bool> _iconStates = {
    'thumb': false,
    'comment': false,
  };
  Map<String, bool> get iconStates => _iconStates;

  void pressIcon({required int index, required String label}) {
    if (label == 'thumb') {
      _posts[index].liked = !_posts[index].liked!;
    }
    // if (label == 'thumb') {
    //   _iconStates.update(label, (value) => !_iconStates[label]!);
    // } else {}
    notifyListeners();
  }

  // Data

  List<Post> get posts => _posts;

  final List<Post> _posts = [
    Post(
      user: User(
        name: 'Komol Kuchkarov',
        username: '@komol',
        imgPath: 'assets/person.jpg',
      ),
      postId: const Uuid().v4(),
      caption: detailText,
      likes: 17,
      comments: 12,
      hashtags: [
        '#cats',
        '#pets',
        '#animals',
        '#cute',
        '#bond',
        '#birthday',
        '#celebration',
        '#aww',
      ],
      imgPath: 'assets/cat.jpg',
      liked: false,
      commented: false,
    ),
    Post(
      user: User(
        name: 'Komol Kuchkarov',
        username: '@komol',
        imgPath: 'assets/person.jpg',
      ),
      postId: const Uuid().v4(),
      caption: detailText,
      likes: 17,
      comments: 12,
      hashtags: [
        '#cats',
        '#pets',
        '#animals',
        '#cute',
        '#bond',
        '#birthday',
        '#celebration',
        '#aww',
      ],
      imgPath: 'assets/cat.jpg',
      liked: false,
      commented: false,
    ),
  ];
}
