import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/model/search_model.dart';

class SearchFilterHelper {
  static List<Coffee> filterCoffee({
    required List<Coffee> coffees,
    required FilterSearchType filterType,
  }) {
    final coffeesLocal = [...coffees];
    switch (filterType) {
      case FilterSearchType.none:
        return coffees;
      case FilterSearchType.bestSell:
        coffeesLocal.sort(
          (a, b) => a.number_of_ratings.compareTo(b.number_of_ratings),
        );
        return coffeesLocal;
      case FilterSearchType.rating:
        coffeesLocal.sort(
          (a, b) => b.rating.compareTo(a.rating),
        );
        return coffeesLocal;
      case FilterSearchType.discount:
        return coffees
            .where(
              (coffee) => coffee.discount_price != null,
            )
            .toList();
      case FilterSearchType.aZ:
        coffeesLocal.sort(
          (a, b) => a.name.compareTo(b.name),
        );
        return coffeesLocal;
      case FilterSearchType.zA:
        coffeesLocal.sort(
          (a, b) => b.name.compareTo(a.name),
        );
        return coffeesLocal;
    }
  }
}
