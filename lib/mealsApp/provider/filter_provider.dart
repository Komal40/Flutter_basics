import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter{
  glutenFree,
  vegetarian
}

class FliterNotifier extends StateNotifier<Map<Filter, bool>>{

  FliterNotifier() : super({
    Filter.glutenFree:false,
  Filter.vegetarian:false,
  });

  void setFilters(Map<Filter, bool> chooseFilters){
      state=chooseFilters;
  }

  void setFilter(Filter filter, bool isActive){
    state={
      ...state,
      filter:isActive,
    };
  }
}

final filterProvider=StateNotifierProvider<FliterNotifier, Map<Filter , bool>>((ref)=>FliterNotifier());
