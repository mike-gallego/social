import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social/models/post.dart';
import 'package:uuid/uuid.dart';

class FirestoreService {
  late FirebaseFirestore _firebaseFirestore;

  FirestoreService() {
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  Future<void> createDummyData({required Post post}) async {
    final collection = _firebaseFirestore.collection('posts');
    for (int i = 0; i < 30; i++) {
      await collection.add({
        "id": const Uuid().v4(),
        "name": post.user!.name,
        "username": post.user!.username,
        "caption": post.caption,
        "hashtags": post.hashtags,
        "likes": post.likes,
        "comments": post.comments,
        "imgPath": post.imgPath,
        "avatarImagePath": post.user!.imgPath,
      });
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchData() async {
    return await _firebaseFirestore.collection('posts').limit(10).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchAllData() async {
    return await _firebaseFirestore.collection('posts').get();
  }
}
