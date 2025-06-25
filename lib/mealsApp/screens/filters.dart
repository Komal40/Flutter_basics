import 'package:flutter/material.dart';
import 'package:first_app/mealsApp/provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum Filter{
//   glutenFree,
//   vegetarian
// }
class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});
  @override
  ConsumerState<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _glutenValue= false;
  var _vegValue=false;

  @override
  void initState() {
    super.initState();
    final activeFilters=ref.read(filterProvider);
    _glutenValue = activeFilters[Filter.glutenFree]!;
    _vegValue= activeFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters")),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          ref.read(filterProvider.notifier).setFilters(
            {
            Filter.glutenFree: _glutenValue,
            Filter.vegetarian: _vegValue,
          }
          );
          // Navigator.of(context).pop();
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenValue,
              onChanged: (ischecked) {
                setState(() {
                  _glutenValue = ischecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                "only gluten-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),

              SwitchListTile(
              value: _vegValue,
              onChanged: (ischecked) {
                setState(() {
                  _vegValue = ischecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                "only veg meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
