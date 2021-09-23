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

  final List<Post> _posts = [];
  List<Post> get posts => _posts;

  Future<void> pressIcon({required String label, required Post post}) async {
    if (label == 'thumb') {
      await _firestoreService.updateLike(id: post.postId!, liked: post.liked!);
      _posts[_posts.indexWhere((element) => element.postId == post.postId)] =
          Post(
        user: post.user,
        caption: post.caption,
        comments: post.comments,
        hashtags: post.hashtags,
        postId: post.postId,
        likes: post.liked! ? post.likes! - 1 : post.likes! + 1,
        liked: !post.liked!,
        commented: post.commented,
        imgPath: 'assets/cat.jpg',
      );
    }
    notifyListeners();
  }

  Future<void> addComment({required Post post}) async {
    List<String> newList = post.comments!;
    newList.add(_controller.text);
    _posts[_posts.indexWhere((element) => element.postId == post.postId)] =
        Post(
      user: post.user,
      caption: post.caption,
      comments: post.comments,
      hashtags: post.hashtags,
      postId: post.postId,
      likes: post.likes,
      liked: post.liked!,
      commented: post.commented,
      imgPath: 'assets/cat.jpg',
    );
    await _firestoreService.updateComment(
        id: post.postId!, comment: controller.text);
    controller.clear();
    _inputNode.unfocus();
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
        comments: e.data()['comments'].cast<String>(),
        hashtags: e.data()['hashtags'].cast<String>(),
        imgPath: e.data()['imgPath'],
        likes: e.data()['likes'],
        postId: e.data()['id'],
        liked: false,
        commented: false,
      ));
    }
    notifyListeners();
  }

  void toggleLoading() {
    _isLoading = !_isLoading!;
    notifyListeners();
  }

  //utils

  void refreshUI() {
    notifyListeners();
  }

  Future<void> createDummyData({required Post post}) async {
    await _firestoreService.createDummyData(post: post);
  }
}
