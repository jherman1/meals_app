import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });

  void setFilter(Filter filter, bool isActive) {
    //State must be updated in an immutable fashion.
    state = {
      ...state,
      filter: isActive,
    }; //this creates a new state by "spreading" the existing state, followed by overriding the specified filter
  }

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

}


final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter,bool>>((ref) => FiltersNotifier());