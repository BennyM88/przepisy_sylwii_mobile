import 'package:flutter/material.dart';

class FavRecipesGrid extends StatelessWidget {
  const FavRecipesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {},
    );
  }
}
