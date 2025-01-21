import 'dart:math';

import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/repo/coffee_repo.dart';
import 'package:beco_coffee/utilities/random.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coffee_notifier.g.dart';

@riverpod
class CoffeeNotifier extends _$CoffeeNotifier {
  @override
  FutureOr<List<Coffee>> build() async {
    return await ref.read(coffeeRepoProvider).getAllCoffees();
  }

  List<Coffee> getRandomCoffees({int count = 4}) {
    final List<Coffee> randCoffees = [];

    if (state.hasValue) {
      final coffees = state.value!;
      if (count > coffees.length) {
        throw Exception(
          'The count of coffees is greater than the total number of coffees',
        );
      }

      randCoffees.addAll(getRandomItems(
        items: coffees,
        count: count,
      ));
    }

    return randCoffees;
  }
}

@riverpod
Future<List<Coffee>> getRandomCoffees(
  Ref ref, {
  int count = 4,
}) async {
  final List<Coffee> randCoffees = [];
  final coffees = await ref.read(coffeeRepoProvider).getAllCoffees();

  if (count > coffees.length) {
        throw Exception(
          'The count of coffees is greater than the total number of coffees',
        );
      }

  randCoffees.addAll(getRandomItems(items: coffees, count: count,));
  return randCoffees;
}

@riverpod
Future<List<Coffee>> getPromotionCoffees(
  Ref ref, {
  int count = 7,
}) async {
  final List<Coffee> randCoffees = [];
  final coffees = await ref.read(coffeeRepoProvider).getAllCoffees();

  if (count > coffees.length) {
        throw Exception(
          'The count of coffees is greater than the total number of coffees',
        );
      }

  randCoffees.addAll(getRandomItems(items: coffees, count: count,));
  return randCoffees;
}
