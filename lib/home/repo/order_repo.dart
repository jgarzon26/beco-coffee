import 'package:beco_coffee/home/model/item.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/repo/cart_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    final order = Order(
      order_id: json['order_id'],
      buyer_id: json['buyer_id'],
      cartItems: items,
      transaction_date: json['transaction_date'] ?? DateTime.now(),
    );

    return order;
  }

  Future<Order?> getOrderByUserId(String userId) async {
    final orderRes =
        await _supabase.from('order').select().eq('buyer_id', userId);

    if (orderRes.isEmpty) {
      return null;
    }

    final orderMap = orderRes[0];

    return _convertFromMap(orderMap);
  }

  /// Either provide the buyer_id or the order_id | never both
  Future<List<String>?> getItemsFromCart(
      {String? userId, String? orderId}) async {
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

  Future<String> addOrder(List<String> itemIds) async {
    final user = _getCurrentUser();

    final response = await _supabase.from('order').insert({
      'buyer_id': user.id,
      'cart': itemIds,
    }).select('order_id');

    return response[0]['order_id'];
  }

  Future<void> updateCart(List<String> itemIds) async {
    await _supabase.from('order').update({
      'cart': itemIds,
    }).eq('buyer_id', _getCurrentUser().id);
  }

  Future<Order?> checkout(String? orderId) async {
    final String orderIdLocal;
    final user = _getCurrentUser();

    if (orderId == null) {
      orderIdLocal = (await getOrderByUserId(user.id))?.order_id ?? '';
    } else {
      orderIdLocal = orderId;
    }

    final updatedOrder = await _supabase
        .from('order')
        .update({
          'transaction_date': DateTime.now().toString(),
        })
        .eq('order_id', orderIdLocal)
        .select();

    return _convertFromMap(updatedOrder[0]);
  }
}

@riverpod
OrderRepo orderRepo(Ref ref) {
  return OrderRepo(ref);
}
