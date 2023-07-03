import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/screens/filters_screen.dart';

final filteredMealsProvider = Provider((ref){
final filters = ref.watch(filterProvider);

 return dummyMeals.where((meal){
   if(filters[Filters.gultenFree]! && !meal.isGlutenFree) {
     return false;
   }
   if(filters[Filters.lactoseFree]! && !meal.isLactoseFree) {
     return false;
   }
   if(filters[Filters.vegetarian]! && !meal.isVegetarian) {
     return false;
   }
   if(filters[Filters.vegan]! && !meal.isVegan) {
     return false;
   }
   return true;
  }).toList();
});