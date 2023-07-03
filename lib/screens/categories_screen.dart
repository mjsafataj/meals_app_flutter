import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category_model.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/Meals_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.availableMeals, super.key});

  final List<Meal> availableMeals;

  @override
  State createState() => CategoryScreenState();

  void _selectCategory(BuildContext context, CategoryModel categoryModel) {
    final filtered = availableMeals
        .where((element) => element.categories.contains(categoryModel.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: categoryModel.title,
          meals: filtered,
        ),
      ),
    );
  }
}

class CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          AnimatedBuilder(
            animation: _animationController,
            child: AnimatedBuilder(
              animation: _animationController,
              child: CategoryItem(
                category: category,
                onSelect: () {
                  widget._selectCategory(context, category);
                },
              ),
              builder: (ctx, child) => SlideTransition(
                position: Tween(
                  begin: Offset(
                      -availableCategories.indexOf(category) % 2 == 0
                          ? -availableCategories.indexOf(category).toDouble() *
                                  0.1 -
                              1.0
                          : availableCategories.indexOf(category).toDouble() *
                                  0.1 +
                              1.0,
                      0),
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeOut,
                  ),
                ),
                child: child,
              ),
            ),
            builder: (ctx, child) => FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeOut,
                ),
              ),
              child: child,
            ),
          )
      ],
    );
  }
}
