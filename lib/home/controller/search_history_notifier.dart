import 'package:beco_coffee/auth/repo/auth_repo.dart';
import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/repo/coffee_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_history_notifier.g.dart';

@riverpod
class SearchHistoryNotifier extends _$SearchHistoryNotifier {
  @override
  FutureOr<List<Coffee>> build() async {
    final coffeeIds = await ref.read(authRepoProvider).getUserSearchQueries();
    return _convertCoffeeIdsToCoffee(coffeeIds);
  }

  Future<List<Coffee>> _convertCoffeeIdsToCoffee(List<String> coffeeIds) async {
    final List<Coffee> coffees = [];

    for (final coffeeId in coffeeIds) {
      final coffee = await ref.read(coffeeRepoProvider).getCoffeeById(coffeeId);
      coffees.add(coffee);
    }

    return coffees;
  }

  Future<void> addCoffeeToSearchHistory(Coffee coffee) async {
    state = const AsyncLoading();
    try {
      final previousSearchHistory =
          await ref.read(authRepoProvider).getUserSearchQueries();

      if (previousSearchHistory.contains(coffee.coffee_id)) {
        previousSearchHistory.remove(coffee.coffee_id);
      }

      final updatedHistory = [coffee.coffee_id, ...previousSearchHistory];

      final coffeeIds = await ref.read(authRepoProvider).updateSearchQueries(updatedHistory);
      final coffees = await _convertCoffeeIdsToCoffee(coffeeIds);
      state = AsyncData(coffees);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
