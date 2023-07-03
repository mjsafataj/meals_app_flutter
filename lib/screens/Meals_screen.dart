import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context,Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) =>  MealDetailScreen(meal:meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("ops! there is no meals"),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index],onSelectMeal:(meal){_selectMeal(context,meal);}),
      );
    }

    if (title==null){
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
