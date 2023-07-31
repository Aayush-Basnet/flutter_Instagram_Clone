import 'package:flutter/material.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/screen/feed_screen.dart';
import 'package:instagram/screen/full_stories_screen.dart';
import 'package:instagram/screen/login_screen.dart';
import 'package:instagram/screen/signup_screen.dart';

import 'package:instagram/screen/view_post_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      home: LoginScreen(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        FeedScreen.id: (context) => FeedScreen(),
        ViewPostScreen.id: (context) => ViewPostScreen(
              post: posts[0],
            ),
        // FullStoryScreen.id:(context)=>FullStoryScreen(storyImage: ),
      },
    );
  }
}
