import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/data/dummy-date.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  const CategoriesScreen({super.key, required this.availableMeals});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void selectCategory(BuildContext context, CategoryMeal category) {
    final data = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              meals: data,
              title: category.title,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: availableCategories
                .map((category) => CategoryGridItem(
                      categoryMeal: category,
                      onSelectCategory: () => selectCategory(context, category),
                    ))
                .toList(),
            // children: [
            //    for (final category in availableCategories)
            //    CategoryGridItem(categoryMeal: category)
            // ],
          ),
          builder: (BuildContext context, Widget? child) => SlideTransition(
                position: Tween(begin: Offset(0, 0.3),end: Offset(0, 0)).animate(
                  CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
                ),
                child: child,
              )),
    );
  }
}
