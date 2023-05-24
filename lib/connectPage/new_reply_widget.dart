// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_project/connectPage/post.dart';
// import 'package:final_project/connectPage/reply.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// class NewReplyWidget extends StatefulWidget {
//   final String userId;
//   final String postId;
//
//   NewReplyWidget({Key? key, required this.userId, required this.postId}) : super(key: key);
//
//   @override
//   _NewReplyWidgetState createState() => _NewReplyWidgetState();
// }
//
// class _NewReplyWidgetState extends State<NewReplyWidget> {
//   final _formKey = GlobalKey<FormState>();
//   final _contentController = TextEditingController();
//
//   //final TextEditingController _replyController = TextEditingController();
//   //final TextEditingController _textEditingController = TextEditingController();
//
//   Future<void> _createReply() async {
//
//     final content = _contentController.text.trim();
//     print('Content: $content');
//
//     if (content.isEmpty) {
//       print('entered');
//       return;
//     }
//
//     final firestore = FirebaseFirestore.instance;
//     final reply = {
//       //'id': Uuid().v4(),
//       'content': content,
//       'createdAt': DateTime.now(),
//       'userId': widget.userId,
//       'postId': widget.postId,
//     };
//
//     try {
//       final repliesRef = firestore.collection('replies');
//       final docRef = await repliesRef.add(reply);
//       print('replies created');
//       final replyDocId = docRef.id;
//       print('replyDocId: $replyDocId');
//
//       final postDoc = await firestore.collection('posts').doc(widget.postId).get();
//
//       print('postDoc: ${postDoc.data()}');
//       print('postId: ${widget.postId}');
//       if(postDoc.exists){
//         print('postDoc does exist');
//         await firestore.collection('posts').doc(widget.postId).update({
//           'replies': FieldValue.arrayUnion([replyDocId])
//
//         });
//       } else { print('error fetching postDoc');}
//     } catch (e) {
//       print('Error adding reply: $e');
//     }
//     _contentController.clear();
//   }
//
//   // void _createReply() async {
//   //   final firestore = FirebaseFirestore.instance;
//   //   final repliesCollection = firestore.collection('replies');
//   //
//   //   final reply = Reply(
//   //     userId: widget.userId,
//   //     postId: widget.postId,
//   //     content: _contentController.text,
//   //     createdAt: Timestamp.now(),
//   //     id: Uuid().v4(),
//   //   );
//   //   await repliesCollection.add(reply.toMap());
//   //  print('widgetId: ${widget.postId}');
//   //   final postDocRef = firestore.collection('posts').doc(widget.postId);
//   //   final postDocSnapshot = await postDocRef.get();
//   //   print('postDocSnapshot data: ${postDocSnapshot.data()}');
//   //
//   //   if(postDocSnapshot.exists) {
//   //     final post = Post.fromMap(postDocSnapshot.data()!);
//   //     if (post.replies == null) {
//   //       post.replies = [];
//   //     }
//   //    final Reply replyObject = Reply.fromMap(reply.toMap());
//   //     post.replies!.add(replyObject);
//   //     final updatedReplies = post.replies!.map((r) => r.toMap()).toList();
//   //     await postDocRef.update({'replies': updatedReplies});
//   //
//   //     // await postDocRef.update({
//   //     //   'replies': post.replies!.cast<Map<String, dynamic>>(),
//   //
//   //       //'replies': post.replies!.map((r) => r.toString()).toList()});
//   //   }
//   //   _contentController.clear();
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: _contentController,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//               labelText: 'Reply content',
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 print('button pressed');
//                 _createReply();
//               }
//             },
//             child: Text('Create reply'),
//           ),
//         ],
//       ),
//     );
//   }
// }
