import 'package:first_app/mealsApp/models/meals.dart';
import 'package:first_app/mealsApp/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailScreen extends ConsumerWidget{

  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favouriteMeals=ref.watch(favouriteMealProvider);

    final isFav=favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: (){
          final isAdd = ref.read(favouriteMealProvider.notifier).toggleMealFavouriteStatus(meal) ;
           ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(isAdd ? 'Marked as Favourite' : 'No longer favourite')));
        }, icon: Icon(isFav ? Icons.star : Icons.star_border),)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
              SizedBox(height: 15,),
              Text("Ingredients", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              for(final ingredient in meal.ingredients)
                  Text(ingredient, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground)),
                SizedBox(height: 15,),
              Text("Steps", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              for(final ingredient in meal.steps)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 7),
                    child: Text(ingredient, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.onBackground),
                                    textAlign: TextAlign.center,),
                  ),
          ],
        ),
      ),
    );
  }
}
