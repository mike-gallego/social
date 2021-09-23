import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social/models/post.dart';
import 'package:social/models/user.dart';
import 'package:social/services/firestore_service.dart';
import 'package:social/styles/texts.dart';

class PostProvider extends ChangeNotifier {
  PostProvider() {
    _firestoreService = FirestoreService();
    _controller = TextEditingController();
    _inputNode = FocusNode();
  }

  late FirestoreService _firestoreService;

  late TextEditingController _controller;
  TextEditingController get controller => _controller;

  late FocusNode _inputNode;
  FocusNode get inputNode => _inputNode;

  bool? _isLoading = false;
  bool? get isLoading => _isLoading;

  Future<void> pressIcon({required String label}) async {
    if (label == 'thumb') {
      //_posts[index].liked = !_posts[index].liked!;
    } else {
      //await _createDummyData(post: _posts[0]);
    }
    notifyListeners();
  }

  Future<void> _createDummyData({required Post post}) async {
    await _firestoreService.createDummyData(post: post);
  }

  void refreshUI() {
    notifyListeners();
  }

  Future<void> fetchData() async {
    final snapshot = await _firestoreService.fetchData();
    for (var e in snapshot.docs) {
      _posts.add(Post(
        user: User(
            name: e.data()['name'],
            username: e.data()['username'],
            imgPath: e.data()['avatarImagePath']),
        caption: e.data()['caption'],
        comments: e.data()['comments'],
        hashtags: e.data()['hashtags'].cast<String>(),
        imgPath: e.data()['imgPath'],
        likes: e.data()['likes'],
        postId: e.data()['id'],
      ));
    }
    notifyListeners();
  }

  void toggleLoading() {
    _isLoading = !_isLoading!;
    notifyListeners();
  }

  final List<Post> _posts = [];
  List<Post> get posts => _posts;
}
