import 'package:cloud_firestore/cloud_firestore.dart';

class Reply {
  String id;
  String postId;
  String userId;
  String? photoUrl;
  String username;
  String content;
  Timestamp createdAt;
  int likecount;

  Reply({
    required this.id,
    required this.postId,
    required this.userId,
    this.photoUrl,
    required this.username,
    required this.content,
    required this.createdAt,
    this.likecount = 0
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'username': username,
      'photoUrl': photoUrl,
      'postId': postId,
      'content': content,
      'createdAt': createdAt,
      'likecount': likecount,
    };
  }

  factory Reply.fromMap(Map<String, dynamic> map) {
    return Reply(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      username: map['username'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      content: map['content'] ?? '',
      createdAt: map['createdAt'] != null  ? (map['createdAt'] as Timestamp) : Timestamp.now(),
      postId: map['postId'] ?? '',
      likecount: map['likecount'] ?? 0,
    );
  }
}