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
}
