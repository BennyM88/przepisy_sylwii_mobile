import 'package:cloud_firestore/cloud_firestore.dart';

class CustomFirestorePaths {
  static CollectionReference<Map<String, dynamic>> recipesPath =
      FirebaseFirestore.instance.collection('recipes');
  static CollectionReference<Map<String, dynamic>> usersPath =
      FirebaseFirestore.instance.collection('users');
}
