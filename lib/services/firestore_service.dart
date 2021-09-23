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
      final docId = const Uuid().v4();
      await collection.doc(docId).set({
        "id": docId,
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

  Future<void> updateLike({required String id, required bool liked}) async {
    final documentReference = _firebaseFirestore.collection('posts').doc(id);

    _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await documentReference.get();

      transaction.update(documentReference, <String, dynamic>{
        'likes': liked
            ? snapshot.data()!['likes'] - 1
            : snapshot.data()!['likes'] + 1
      });
    });
  }

  Future<void> updateComment(
      {required String id, required String comment}) async {
    final documentReference = _firebaseFirestore.collection('posts').doc(id);

    _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await documentReference.get();
      List<String> newList = snapshot.data()!['comments'].cast<String>();
      newList.add(comment);

      transaction
          .update(documentReference, <String, dynamic>{'comments': newList});
    });
  }
}
