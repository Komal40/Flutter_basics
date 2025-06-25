import 'package:first_app/mealsApp/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget{

  const CategoryItem({super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell( //to tap
      onTap: onSelectCategory,
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.55), category.color.withOpacity(0.9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color :Theme.of(context).colorScheme.onBackground),),
      ),
    );
  }
}
