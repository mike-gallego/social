import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/providers/post_provider.dart';
import 'package:social/screens/feed_screen.dart';
import 'package:social/widgets/post/post_component.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostProvider(),
          lazy: false,
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Social Demo',
        home: FeedScreen(),
      ),
    );
  }
}
