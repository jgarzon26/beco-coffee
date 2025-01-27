import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/repo/coffee_repo.dart';
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

  Future<List<Order>> getListOfOrders() async {
    final List<Order> orders = [];

    final user = _getCurrentUser();

    final userOrders = await _supabase
        .from('user_order')
        .select('*, user_id:users!user_id(user_id), order:order!order_id(*)')
        .eq('user_id', user.id);

    for (final userOrder in userOrders) {
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
        ),
      );
    }

    return orders;
  }

  Future<void> addOrder(Order order) async {
    final user = _getCurrentUser();

    final orderRes = await _supabase
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
    }
  }

  Future<Map<String, dynamic>> getOrderById(String orderId) async {
    final orderRes =
        await _supabase.from('order').select().eq('order_id', orderId);

    return orderRes[0];
  }

  Future<Order> updateQuantity(int quantity, Order prevOrder) async {
    final order = prevOrder.copyWith(
      quantity: quantity,
    );

    await _supabase.from('user_order').update({
      'quantity': quantity,
    }).eq('order_id', prevOrder.order_id);

    return order;
  }

  Future<void> updateOrders(List<Order> newOrders) async {
    for (final order in newOrders) {
      await updateQuantity(order.quantity, order);
    }
  }

  void deleteOrder(Order order) {
    _supabase.from('order').delete().eq('order_id', order.order_id);
  }
}

@riverpod
OrderRepo orderRepo(Ref ref) {
  return OrderRepo(ref);
}
