import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[500],
      width: double.infinity,
      height: 350,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/profilepic.jpg'),
            //   ),
            // ),
            child: Container(
              width: 100,
              height: 100,
              child: CircleAvatar(
                radius: 100,
                backgroundImage:
                FirebaseAuth.instance.currentUser?.photoURL != null
                ? NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!) as ImageProvider<Object>
                : AssetImage('assets/images/profilepic.jpg'),

              ),
            )
          ),
          Text(FirebaseAuth.instance.currentUser?.displayName ?? 'Guest',
            style: TextStyle(color: Colors.white,fontSize: 20),),
          Text(FirebaseAuth.instance.currentUser?.email ?? 'guest@example.com',
            style: TextStyle(color: Colors.black,fontSize: 14),)

        ],
      ),
    );
  }
}
