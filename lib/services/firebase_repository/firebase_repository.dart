import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:przepisy_sylwii_mobile/constants/firestore_paths.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';

@injectable
class FirebaseRepository {
  final _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async => await _auth.signOut();

  Future<List<Recipe>> getAllRecipes() async {
    QuerySnapshot recipesSnapshot =
        await CustomFirestorePaths.recipesPath.get();
    List<Recipe> allRecipes = recipesSnapshot.docs
        .map((doc) => Recipe.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return allRecipes;
  }
}
