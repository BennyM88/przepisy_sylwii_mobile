import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:przepisy_sylwii_mobile/constants/firestore_paths.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/models/user_profile.dart';

@injectable
class FirebaseRepository {
  final _auth = FirebaseAuth.instance;

  User? currentUser() => _auth.currentUser;

  Stream<User?> watchFirebaseUser() => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await _auth.signInWithEmailAndPassword(email: email, password: password);

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await CustomFirestorePaths.usersPath.doc(result.user?.email).set({
      'email': email,
      'creationTime': result.user?.metadata.creationTime.toString(),
    });
  }

  Future<void> signOut() async => await _auth.signOut();

  Future<UserProfile> getUserDetails() async {
    DocumentSnapshot data = await CustomFirestorePaths.usersPath
        .doc(_auth.currentUser?.email)
        .get();
    return UserProfile(
      email: data['email'],
      accountCreated: data['creationTime'],
    );
  }

  Future<List<Recipe>> getAllRecipes() async {
    QuerySnapshot recipesSnapshot =
        await CustomFirestorePaths.recipesPath.get();
    List<Recipe> allRecipes = recipesSnapshot.docs
        .map((doc) => Recipe.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return allRecipes;
  }
}
