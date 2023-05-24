import 'package:final_project/connectPage/post_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'new_post_widget.dart';

class MyConnectApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Share your story'),
        ),
        body:
        Column(
          children: [
            NewPostWidget(userId: _auth.currentUser!.uid,),
            Expanded(
              child: PostsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
