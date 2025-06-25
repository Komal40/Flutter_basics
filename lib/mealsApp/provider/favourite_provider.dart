import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:first_app/mealsApp/models/meals.dart';


class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    final isMealFavourite = state.contains(meal);

    if (isMealFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>(
  (ref) => FavouriteMealNotifier(),
);
