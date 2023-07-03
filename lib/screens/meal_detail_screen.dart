import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorite_meals_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({required this.meal, Key? key}) : super(key: key);

  final Meal meal;

  String get steps {
    var str = "";
    for (final item in meal.steps) {
      str += item;
      str += "\n";
    }
    return str;
  }

  String get ingredients {
    var str = "";
    for (final item in meal.ingredients) {
      str += item;
      str += "\n";
    }
    return str;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(favoriteMealProvider.notifier)
                  .toggleMealFavoritesStatus(meal);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, anim) => RotationTransition(
                turns: Tween<double>(begin: 0.9, end: 1).animate(
                    CurvedAnimation(
                      parent: anim,
                      curve: Curves.easeOut,
                    ),
                    ),
                child: child,
              ),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 25,
                color: Colors.deepOrangeAccent,
              ),
            ),
            Text(
              ingredients,
              style: const TextStyle(height: 2),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Steps",
              style: TextStyle(
                height: 2,
                fontSize: 25,
                color: Colors.deepOrangeAccent,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              steps,
              style: const TextStyle(height: 2),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
