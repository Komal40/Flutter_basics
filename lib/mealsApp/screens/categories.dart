import 'package:first_app/mealsApp/data/dummy_data.dart';
import 'package:first_app/mealsApp/models/category.dart';
import 'package:first_app/mealsApp/screens/meals.dart';
import 'package:first_app/mealsApp/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});


  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      //set number of columns
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryItem(
            category: category,
            onSelectCategory: () {
              _selectedCategory(context, category);
            },
          ),
      ],
    );
  }
}
