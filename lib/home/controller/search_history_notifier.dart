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
    return ref.read(coffeeRepoProvider).convertCoffeeIdsToCoffee(coffeeIds);
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
      final coffees = await ref.read(coffeeRepoProvider).convertCoffeeIdsToCoffee(coffeeIds);
      state = AsyncData(coffees);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
