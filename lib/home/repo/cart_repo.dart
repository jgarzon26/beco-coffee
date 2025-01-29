import 'package:beco_coffee/home/model/item.dart';
import 'package:beco_coffee/home/repo/coffee_repo.dart';
import 'package:beco_coffee/home/repo/order_repo.dart';
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
        .select('*, coffee(*)')
        .eq('item_id', itemId);

    if (itemRes.isEmpty) {
      return null;
    }

    final item = itemRes.first;

    final coffee =
        await ref.read(coffeeRepoProvider).getCoffeeById(item['coffee_id']);

    return Item(
      item_id: item['item_id'],
      coffee: coffee,
      coffee_size: CoffeeSize.values.byName(item['coffee_size']),
      coffee_sugar: CoffeeSugar.values.byName(item['coffee_sugar']),
      quantity: item['quantity'],
    );
  }

  Future<List<Item>> getItemsFromCart() async {
    final user = _getCurrentUser();

    final order = await ref.read(orderRepoProvider).getOrderByUserId(user.id);

    if (order == null) {
      return [];
    }

    return order.cartItems;

    /*  for (final userOrder in userOrders) {
      final order = userOrder['order'];
      final coffee =
          await ref.read(coffeeRepoProvider).getCoffeeById(order['coffee_id']);
      orders.add(
        Order(
          order_id: userOrder['order_id'],
          coffee: coffee,
          coffee_size: CoffeeSize.values.byName(order['coffee_size']),
          coffee_sugar: CoffeeSugar.values.byName(order['coffee_sugar']),
          quantity: userOrder['quantity'],
          order_date: DateTime.tryParse(userOrder['transaction_date'] ?? '') ??
              DateTime.now(),
        ),
      );
    }

    return orders; */
  }

  Future<void> addItemToCart(Item item) async {
    final user = _getCurrentUser();

    final addedItem = await _supabase.from('cart').insert(
      {
        'coffee_id': item.coffee.coffee_id,
        'coffee_size': item.coffee_size.name,
        'coffee_sugar': item.coffee_sugar.name,
      },
    ).select('item_id');

    final order = await ref.read(orderRepoProvider).getOrderByUserId(user.id);

    //Upon first item added to cart, order row data is added as well
    if (order == null) {
      await ref.read(orderRepoProvider).addOrder(
        [addedItem[0]['item_id']],
      );
    } else {
      final List<String> prevCart =
          order.cartItems.map((item) => item.item_id).toList();

      final newCart = [...prevCart, addedItem[0]['item_id'] as String];

      await ref.read(orderRepoProvider).updateCart(newCart);
    }

    /* final orderRes = await _supabase
        .from('order')
        .select()
        .eq('coffee_id', order.coffee.coffee_id);

    if (orderRes.isEmpty) {
      final response = await _supabase.from('order').insert({
        'coffee_id': order.coffee.coffee_id,
        'coffee_size': order.coffee_size.name,
        'coffee_sugar': order.coffee_sugar.name,
      }).select();

      final addedOrder = response[0];

      await _supabase.from('user_order').insert({
        'user_id': user.id,
        'order_id': addedOrder['order_id'],
      });
    } else {
      await _supabase.from('order').update({
        'coffee_size': order.coffee_size.name,
        'coffee_sugar': order.coffee_sugar.name,
      }).eq('order_id', orderRes[0]['order_id']);
    } */
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