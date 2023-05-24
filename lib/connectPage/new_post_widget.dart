import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/connectPage/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
const String defaultProfilePic = 'assets/images/profilepic.jpg';
class NewPostWidget extends StatefulWidget {
  final String userId;

  NewPostWidget({Key? key, required this.userId}) : super(key: key);

  @override
  _NewPostWidgetState createState() => _NewPostWidgetState();
}

class _NewPostWidgetState extends State<NewPostWidget> {
  final _formKey = GlobalKey<FormState>();
  final _contentController = TextEditingController();

  void _createPost() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final postsCollection = _firestore.collection('posts');
    final User? user = _auth.currentUser;
    final uid = user!.uid;
    final username = user.displayName;
    final photoUrl = user.photoURL;

    final post = Post(
      id: '',
      userId: widget.userId,
      username: username ?? 'Anonymous',
      content: _contentController.text,
      createdAt: Timestamp.now(),
      replies: [],
      photoUrl: photoUrl ?? null,
      likecount: 0,
    );
    final docRef = await postsCollection.add(post.toMap());
    final postId = docRef.id;
    print('Post created with ID: $postId');
    post.id = postId; // fill id field with firestore generated ID
    await  docRef.set(post.toMap(), SetOptions(merge: true));
    print('photoUrl: ${post.photoUrl}');

    _contentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _contentController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Post content',
                      labelStyle: TextStyle(color: Colors.teal),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.teal)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _createPost();
                    }
                  },
                  child: Text('Post'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}