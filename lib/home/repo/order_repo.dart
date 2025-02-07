import 'package:beco_coffee/home/model/item.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/repo/cart_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlng/latlng.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'order_repo.g.dart';

class OrderRepo {
  final _supabase = Supabase.instance.client;
  final Ref ref;

  OrderRepo(this.ref);

  User _getCurrentUser() {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw Exception('User is not logged in');
    }

    return user;
  }

  Future<Order?> _convertFromMap(Map<String, dynamic> json) async {
    final itemIds = await getItemsFromCart(orderId: json['order_id']);

    if (itemIds == null) {
      return null;
    }

    final List<Item> items =
        await ref.read(cartRepoProvider).convertItemIdsToItem(itemIds);

    return Order.fromJsonWhileManuallyAddCart(json, items);
  }

  Future<Order?> getLatestOrder() async {
    final user = _getCurrentUser();

    final orderRes =
        await _supabase.from('order').select().eq('buyer_id', user.id);

    if (orderRes.isEmpty) {
      return null;
    }

    final orderMap = orderRes[0];

    return _convertFromMap(orderMap);
  }

  /// Either provide the buyer_id or the order_id | never both
  Future<List<String>?> getItemsFromCart({
    String? userId,
    String? orderId,
  }) async {
    final columnName = userId != null ? 'buyer_id' : 'order_id';
    final columnValue = userId ?? orderId!;

    final response =
        await _supabase.from('order').select().eq(columnName, columnValue);

    if (response.isEmpty) {
      return null;
    }

    final items = List<String>.from(response[0]['cart'] as List);

    return items;
  }

  Future<List<Item>> getItemsFromOrderItems(String orderId) async {
    final itemIds = await getItemsFromCart(orderId: orderId);

    if (itemIds == null) {
      return [];
    }

    final List<Item> orderedItems = [];

    for (final itemId in itemIds) {
      final itemRes = (await _supabase
          .from('order_items')
          .select('*, coffee(*)')
          .eq('item_id', itemId))[0];
      orderedItems.add(Item.fromJson(itemRes));
    }

    return orderedItems;
  }

  Future<Order> addOrder(List<String> itemIds) async {
    final user = _getCurrentUser();

    final addedOrder = (await _supabase.from('order').insert({
      'buyer_id': user.id,
      'cart': itemIds,
    }).select())[0];

    final cartItems =
        await ref.read(cartRepoProvider).convertItemIdsToItem(itemIds);

    final order = Order.fromJsonWhileManuallyAddCart(addedOrder, cartItems);

    return order;
  }

  Future<void> updateCart(List<String> itemIds) async {
    await _supabase.from('order').update({
      'cart': itemIds,
    }).eq('buyer_id', _getCurrentUser().id);
  }

  Future<Order> checkout(String orderId, LatLng address) async {
    final addressJson = {
      'lat': address.latitude.degrees,
      'lng': address.longitude.degrees,
    };

    final response = (await _supabase
        .from('order')
        .update({
          'transaction_date': DateTime.now().toString(),
          'transaction_address': addressJson,
        })
        .eq('order_id', orderId)
        .select())[0];

    final itemIds = (response['cart'] as List<dynamic>)
        .map((itemId) => itemId.toString())
        .toList();

    await ref.read(cartRepoProvider).onCheckout(itemIds);

    final items = await ref
        .read(cartRepoProvider)
        .convertItemIdsToItem(itemIds, itemDatabase: ItemDatabase.order_items);

    return Order.fromJsonWhileManuallyAddCart(response, items);
  }
}

@riverpod
OrderRepo orderRepo(Ref ref) {
  return OrderRepo(ref);
}
