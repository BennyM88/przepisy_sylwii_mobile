import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'package:przepisy_sylwii_mobile/constants/firestore_paths.dart';
import 'package:przepisy_sylwii_mobile/models/user_profile.dart';

@injectable
class FirebaseAuthRepository {
  final _auth = FirebaseAuth.instance;

  User? currentUser() => _auth.currentUser;

  Stream<User?> watchFirebaseUser() => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await _auth.signInWithEmailAndPassword(email: email, password: password);

  Future<User?> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    if (googleAuth?.accessToken == null) {
      return null;
    }

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _auth.signInWithCredential(credential);

    User? user = _auth.currentUser;
    if (user == null) throw Exception();

    await CustomFirestorePaths.usersPath.doc(user.email).set({
      'email': user.email,
      'creationTime': user.metadata.creationTime.toString(),
      'firstName': user.displayName ?? user.email,
      'uid': user.uid,
    });

    return _auth.currentUser;
  }

  Future<void> createUserWithEmailAndPassword({
    required String name,
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
      'firstName': name,
      'uid': result.user?.uid,
    });
  }

  Future<void> signOut() async => await _auth.signOut();

  Future<void> deleteAcc() async {
    await CustomFirestorePaths.usersPath.doc(_auth.currentUser!.email).delete();
    await _auth.currentUser!.delete();
  }

  Future<UserProfile> getUserDetails() async {
    DocumentSnapshot data = await CustomFirestorePaths.usersPath
        .doc(_auth.currentUser?.email)
        .get();
    return UserProfile(
      email: data['email'],
      accountCreated: data['creationTime'],
      firstName: data['firstName'],
      uid: data['uid'],
    );
  }

  Future<void> reauthenticateWithCredential({
    required AuthCredential credential,
  }) async {
    await _auth.currentUser!.reauthenticateWithCredential(credential);
  }
}
