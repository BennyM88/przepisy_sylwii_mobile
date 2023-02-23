import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'package:przepisy_sylwii_mobile/constants/firestore_paths.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';

@injectable
class FirebaseRepository {
  Future<List<Recipe>> getAllRecipes() async {
    QuerySnapshot recipesSnapshot =
        await CustomFirestorePaths.recipesPath.get();
    List<Recipe> allRecipes = recipesSnapshot.docs
        .map((doc) => Recipe.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return allRecipes;
  }

  Future<List<Recipe>> getAllFavoritesRecipes(String? user) async {
    QuerySnapshot favoritesRecipesSnapshot = await CustomFirestorePaths
        .usersPath
        .doc(user)
        .collection('favorites')
        .get();
    List<Recipe> allFavoritesRecipes = favoritesRecipesSnapshot.docs
        .map((doc) => Recipe.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return allFavoritesRecipes;
  }

  Future<void> addToFavorites(Recipe recipe, String? user) async {
    await CustomFirestorePaths.usersPath
        .doc(user)
        .collection('favorites')
        .doc(recipe.dishName)
        .set(recipe.toJson());
  }

  Future<void> removeFromFavorites(Recipe recipe, String? user) async {
    await CustomFirestorePaths.usersPath
        .doc(user)
        .collection('favorites')
        .doc(recipe.dishName)
        .delete();
  }

  Future<void> addNewRecipe(Recipe recipe) async {
    await CustomFirestorePaths.recipesPath.doc().set(recipe.toJson());
  }
}
