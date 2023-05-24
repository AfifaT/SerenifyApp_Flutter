import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Mood {
  Great,
  Good,
  Okay,
  Bad,
  Awful,
}

class MoodTracker {
  final List<Mood> _recentMoods = [];

  final CollectionReference _moodHistoryCollection =
  FirebaseFirestore.instance.collection('mood_history');

  late User? user; // Declare user as a nullable instance variable
  late String? userId;

  MoodTracker() {
    user = FirebaseAuth.instance.currentUser;
    userId = user?.uid;// Initialize user in the constructor
  }

  Future<void> loadMoodHistory() async {
    final querySnapshot = await _moodHistoryCollection.get();
    final moodValues = querySnapshot.docs
        .map((doc) => Mood.values[(doc.data() as Map<String,dynamic>)['mood']])
        .toList();
    _recentMoods.addAll(moodValues);
  }

  List<Mood> getRecentMoods() {
    return _recentMoods;
  }

  Future<void> addMood(Mood mood) async {
    final moodData = {'mood': mood.index,
                      'timestamp': FieldValue.serverTimestamp(),
                      'userId': userId,};
    await _moodHistoryCollection.add(moodData);
    _recentMoods.add(mood);

  }

  Future<void> clearMoodHistory() async {
    await _moodHistoryCollection
        .where('userId', isEqualTo: userId)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
    _recentMoods.clear();
  }

  Future<void> deleteMoodHistory(DocumentSnapshot? document) async {
    if (document != null) {
      await document.reference.delete();
      final mood = (document.data() as Map<String, dynamic>)['mood'];
      if (mood != null) {
        _recentMoods.removeAt(_recentMoods.indexWhere(
                (mood) => mood == Mood.values[(mood as int)]));
      }
    }
  }

  getStreamOfMoods() {
    return FirebaseFirestore.instance
        .collection('mood_history')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

}
