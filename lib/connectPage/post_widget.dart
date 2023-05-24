import 'package:final_project/connectPage/post.dart';
import 'package:final_project/connectPage/post_likes.dart';
import 'package:final_project/connectPage/reply.dart';
import 'package:final_project/connectPage/reply_likes.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class PostsWidget extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('posts').orderBy(
          'createdAt', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }

        final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (BuildContext context, int index) {
            final post = Post.fromMap(documents[index].data() as Map<String, dynamic>);
            final formattedDate = DateFormat('dd/MM/yyyy').format(post.createdAt.toDate());

            final Stream<int> replyCountStream = _firestore
                .collection('replies')
                .where('postId', isEqualTo: post.id)
                .snapshots()
                .map((QuerySnapshot querySnapshot) => querySnapshot.docs.length);

            return Card(
              color: Colors.white70,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: post.photoUrl?.isNotEmpty == true
                        ? CircleAvatar(
                          backgroundImage: NetworkImage(post.photoUrl!) ,
                        )
                        : const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/profilepic.jpg'),
                         ),

                        title: Row(
                          children: [
                            SizedBox(height: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${post.username}',style: TextStyle(fontSize: 13),),
                                Text('${formattedDate}',style: TextStyle(fontSize: 10),textAlign: TextAlign.start),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Text(post.content,style: TextStyle(fontSize: 16,color: Colors.black),),
                        trailing: IconButton(
                          icon: Icon(Icons.reply,color: Colors.teal, size: 20,),
                          onPressed: () {
                            _showReplyDialog(context, post.id );
                          },
                        ),
                      ),
                      StreamBuilder<int>(
                        stream: replyCountStream,
                        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text('Loading...');
                          }
                          if(snapshot.data == 0) {
                            return Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _showReplyDialog(context, post.id);
                                  },
                                  child: Text('No Reply',style: TextStyle(color: Colors.green),),
                                ),
                                SizedBox(width: 10),
                                PostLikes(postId: post.id)
                              ],
                            );
                          }
                          if(snapshot.data == 1) {
                            return Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _showReplies(context, post.id);
                                  },
                                  child: Text('${snapshot.data} Reply',style: TextStyle(color: Colors.green),),
                                ),
                                SizedBox(width: 10),
                                PostLikes(postId: post.id)
                              ],
                            );
                          }
                          else{
                            return Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _showReplies(context, post.id);
                                  },
                                  child: Text('${snapshot.data} Replies',style: TextStyle(color: Colors.green),),
                                ),
                                SizedBox(width: 10),
                                PostLikes(postId: post.id)
                              ],
                            );
                          }

                        },
                      ),
                    ],
                  ),
                )
            );
          },
        );
      },
    );
  }

  void _showReplies(BuildContext context, String postId) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
            Scaffold(
              backgroundColor: Colors.teal[100],
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Replies'),
              ),
              body: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('replies').where(
                    'postId', isEqualTo: postId)
                    .orderBy('createdAt')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                     return Text(snapshot.error.toString());
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final List<QueryDocumentSnapshot> documents = snapshot.data!
                      .docs;

                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      final reply = Reply.fromMap(documents[index].data() as Map<String, dynamic>);
                      final formattedDate = DateFormat('dd/MM/yyyy').format(reply.createdAt.toDate());

                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          leading: reply.photoUrl?.isNotEmpty == true
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(reply.photoUrl!) ,
                      )
                          : const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profilepic.jpg'),
                      ),
                          subtitle: Text(reply.content, style: TextStyle(fontSize: 16, color: Colors.black)),
                          title: Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(reply.username, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.teal)),
                                SizedBox(height: 3),
                                Text(formattedDate, style: TextStyle(fontSize: 12, color: Colors.grey,),),
                                SizedBox(height: 10,)
                              ],
                            ),
                          ),
                          trailing: ReplyLikes(replyId: reply.id),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
      ),
    );
  }

  void _showReplyDialog(BuildContext context, String postId) {
    final _contentController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[50],
          title: const Text('Reply to post',style: TextStyle(color: Colors.teal),),
          content: TextField(
            controller: _contentController,
            decoration: const InputDecoration(hintText: 'Enter your reply'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL',style: TextStyle(color: Colors.teal),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('REPLY',style: TextStyle(color: Colors.teal),),
              onPressed: () async {
                if (_contentController.text.isNotEmpty) {
                  // Create a new reply document
                  final docRef = _firestore.collection('replies').doc();
                  final User? user = _auth.currentUser;
                  final uid = user!.uid;
                  final username = user.displayName;
                  final photoUrl = user.photoURL;

                  final reply = Reply(
                    id: docRef.id,
                    userId: _auth.currentUser!.uid,
                    username: username ?? 'Anonymous',
                    photoUrl: photoUrl ?? null,
                    content: _contentController.text,
                    createdAt: Timestamp.now(),
                    postId: postId,
                  );
                  await docRef.set(reply.toMap());

                  final postRef = FirebaseFirestore.instance.collection('posts').doc(postId);
                  postRef.set({'replies': FieldValue.arrayUnion([docRef])}, SetOptions(merge: true));// convert DocumentSnapshot to Map
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
