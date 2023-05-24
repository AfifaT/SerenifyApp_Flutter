import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostLikes extends StatefulWidget {
  final String postId;

  PostLikes({required this.postId});

  @override
  _PostLikesState createState() => _PostLikesState();
}

class _PostLikesState extends State<PostLikes> {
  int _likes = 0;
  bool _liked = false;
  String? _currentUserId;
  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _currentUserId = user.uid;
    }
    super.initState();
    _getLikes();
  }

  Future<void> _getLikes() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .get();

      setState(() {
        _likes = snapshot.data()?['likecount'] ?? 0;
        if (_currentUserId != null &&
            snapshot.data()?['likedBy']?.contains(_currentUserId) == true) {
          _liked = true;
        }
      });
  }

  Future<void> _likePost() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .update({
      'likecount': FieldValue.increment(1),
      'likedBy': FieldValue.arrayUnion([user.uid]),
    });
      setState(() {
        _likes++;
        _liked = true;
      });
  }

  Future<void> _unlikePost() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .update({
      'likecount': FieldValue.increment(-1),
      'likedBy': FieldValue.arrayRemove([user.uid]),
    });

      setState(() {
        _likes--;
        _liked = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print('$_liked');
        if (_liked) {
          await _unlikePost();
          print('Unliked');
        } else {
          await _likePost();
          print('Pressed like');
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: _liked ? Colors.teal : Colors.grey,
            size: 20,
          ),
          SizedBox(width: 4),
          Text(_likes.toString()),
        ],
      ),
    );
  }
}
