import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/repo/coffee_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coffee_notifier.g.dart';

@riverpod
class CoffeeNotifier extends _$CoffeeNotifier {
  @override
  FutureOr<List<Coffee>> build() {
    return ref.read(coffeeRepoProvider).getAllCoffees();
  }

  
}
