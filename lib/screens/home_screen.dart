import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filterd_meals_provider.dart';
import 'package:meals/screens/Meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/main_drawer.dart';
import 'package:meals/providers/favorite_meals_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  var selectedTitle = "";
  var selectedTab = 0;

  void _selectDrawerItem(DrawerSelectedItem selectedDrawerItem) {
    if (selectedDrawerItem == DrawerSelectedItem.filters) {

      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  const FiltersScreen()));

    } else if (selectedDrawerItem == DrawerSelectedItem.meals) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var availableMeals = ref.watch(filteredMealsProvider);

    selectedTitle = "Categories";
    Widget content = CategoryScreen(availableMeals:availableMeals);

    if (selectedTab == 1) {
      final favoriteMeals = ref.watch(favoriteMealProvider);
      selectedTitle = "Your favorites";
      content =  MealsScreen(meals:favoriteMeals);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTitle),
      ),
      drawer: MainDrawer(selectDrawerItem: _selectDrawerItem),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        currentIndex: selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          )
        ],
      ),
      body: content,
    );
  }
}
