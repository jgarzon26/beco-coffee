import 'package:beco_coffee/home/model/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'cart_repo.g.dart';

class CartRepo {
  final _supabase = Supabase.instance.client;
  final Ref ref;

  CartRepo(this.ref);

  User _getCurrentUser() {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw Exception('User is not logged in');
    }

    return user;
  }

  Future<Item?> getItemById(String itemId) async {
    final itemRes = await _supabase
        .from('cart')
        .select('*, coffee(*, category:coffee_category!category_id(*),company:company!company_id(*))')
        .eq('item_id', itemId);

    if (itemRes.isEmpty) {
      return null;
    }

    final item = itemRes.first;

    return Item.fromJson(item);
  }

  Future<List<Item>> getItemsFromCart() async {
    final user = _getCurrentUser();

    final items = await _supabase
        .from('cart')
        .select('*, coffee(*, category:coffee_category!category_id(*),company:company!company_id(*))')
        .eq('buyer_id', user.id);

    if (items.isEmpty) {
      return [];
    }

    final List<Item> itemsList = [];

    for (final itemMap in items) {
      final item = Item.fromJson(itemMap);
      itemsList.add(item);
    }

    return itemsList;
  }

  Future<void> addItemToCart(Item item) async {
    final user = _getCurrentUser();

    await _supabase.from('cart').insert(
      {
        'coffee_id': item.coffee.coffee_id,
        'coffee_size': item.coffee_size.name,
        'coffee_sugar': item.coffee_sugar.name,
        'buyer_id': user.id,
      },
    );
  }

  Future<Map<String, dynamic>> getOrderById(String orderId) async {
    final orderRes =
        await _supabase.from('order').select().eq('order_id', orderId);

    return orderRes[0];
  }

  Future<List<Item>> convertItemIdsToItem(List<String> itemIds) async {
    final List<Item> items = [];

    for (final itemId in itemIds) {
      final item = await getItemById(itemId);
      if (item == null) {
        throw Exception('Item not found');
      }
      items.add(item);
    }

    return items;
  }

  Future<Item> updateQuantity(int quantity, Item prevItem) async {
    final item = prevItem.copyWith(
      quantity: quantity,
    );

    await _supabase.from('cart').update({
      'quantity': quantity,
    }).eq('item_id', prevItem.item_id);

    return item;
  }

  Future<void> updateItems(List<Item> newItems) async {
    for (final item in newItems) {
      await updateQuantity(item.quantity, item);
    }
  }

  Future<void> deleteItem(Item item) async {
    await _supabase.from('cart').delete().eq('item_id', item.item_id);
  }
}

@riverpod
CartRepo cartRepo(Ref ref) {
  return CartRepo(ref);
}
