import 'package:first_app/mealsApp/provider/favourite_provider.dart';
import 'package:first_app/mealsApp/screens/categories.dart';
import 'package:first_app/mealsApp/screens/filters.dart';
import 'package:first_app/mealsApp/screens/meals.dart';
import 'package:first_app/mealsApp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:first_app/mealsApp/provider/filter_provider.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectpageIndex = 0;

  void _showInfoMessage(String message) {

  }



  void changePageIndex(int index) {
    setState(() {
      _selectpageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final res = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => FilterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
    );
    var activeTitle = 'Categories';

    if (_selectpageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
      );
      activeTitle = 'Favourites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activeTitle)),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          changePageIndex(index);
        },
        currentIndex: _selectpageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
