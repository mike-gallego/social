import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  final List<String> _hashtags = [
    '#cats',
    '#pets',
    '#animals',
    '#cute',
    '#bond',
    '#birthday',
    '#celebration',
    '#aww'
  ];

  List<String> get hashtags => _hashtags;
}
