import 'package:cloud_firestore/cloud_firestore.dart';

class CustomFirestorePaths {
  static CollectionReference<Map<String, dynamic>> recipesPath =
      FirebaseFirestore.instance.collection('recipes');
}
