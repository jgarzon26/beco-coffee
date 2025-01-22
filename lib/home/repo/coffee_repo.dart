import 'package:beco_coffee/home/model/category.dart';
import 'package:beco_coffee/home/model/coffee.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'coffee_repo.g.dart';

class CoffeeRepo {
  final supabase = Supabase.instance.client;

  Future<List<Coffee>> getAllCoffees() async {
    final response = await supabase.from('coffee').select(
        '*, category:coffee_category!category_id(*),company:company!company_id(*)');

    final coffees = response.map(
      (coffee) {
        return Coffee.fromJson(coffee);
      },
    ).toList();

    return coffees;
  }

  Future<List<Category>> getAllCategories() async {
    final categories = await supabase.from('coffee_category').select();

    return categories.map((category) {
      return Category.fromJson(category);
    }).toList();
  }

  Future<Coffee> getCoffeeById(String id) async {
    final coffee =
        (await supabase.from('coffee').select('*, category:coffee_category!category_id(*),company:company!company_id(*)').eq('coffee_id', id))[0];

    return Coffee.fromJson(coffee);
  }
}

@riverpod
CoffeeRepo coffeeRepo(Ref ref) {
  return CoffeeRepo();
}

@riverpod
Future<List<Category>> getCategories(Ref ref) {
  return ref.read(coffeeRepoProvider).getAllCategories();
}
