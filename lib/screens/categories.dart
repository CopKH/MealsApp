import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/data/dummy-date.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  
  const CategoriesScreen({super.key,required this.availableMeals});
  void selectCategory(BuildContext context, CategoryMeal category) {
    final data = availableMeals
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
      body: GridView(
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
    );
  }
}
