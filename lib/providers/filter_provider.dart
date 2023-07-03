import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/filters_screen.dart';

class FilterNotifier extends StateNotifier<Map<Filters,bool>> {
  FilterNotifier() :super({
    Filters.gultenFree: false,
    Filters.lactoseFree: false,
    Filters.vegetarian: false,
    Filters.vegan: false,},);

  void changeFilter(Filters filter,bool isChecked){
    state={
      ...state,filter:isChecked
    };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier,Map<Filters,bool>>((ref) =>FilterNotifier());