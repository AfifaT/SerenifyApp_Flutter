import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  String userId;
  String username;
  String? photoUrl;
  String content;
  Timestamp createdAt;
  List<DocumentReference>? replies;
  int likecount;

  Post({
    required this.id,
    required this.userId,
    required this.username,
    this.photoUrl,
    required this.content,
    required this.createdAt,
    this.replies ,
    this.likecount = 0
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'username': username,
      'photoUrl': photoUrl,
      'content': content,
      'createdAt': createdAt,
      'replies': replies,
      'likecount': likecount,

    };
  }

 factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      username: map['username'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      content: map['content'] ?? '',
      createdAt: map['createdAt'] != null ? (map['createdAt'] as Timestamp) : Timestamp.now(),
      replies: (map['replies'] as List<dynamic>?)?.cast<DocumentReference>(),
      likecount: map['likecount'] ?? 0,
    );
  }
}







