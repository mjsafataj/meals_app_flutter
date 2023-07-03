import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() :super([]);

  void toggleMealFavoritesStatus(Meal meal) {
    final isExisted = state.contains(meal);

    if (isExisted) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteMealProvider = StateNotifierProvider<FavoriteMealsNotifier,
    List<Meal>>((ref) {
  return FavoriteMealsNotifier();
}
);