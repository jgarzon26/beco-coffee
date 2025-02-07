import 'package:beco_coffee/home/controller/checkout_notifier.dart';
import 'package:beco_coffee/home/controller/order_notifier.dart';
import 'package:beco_coffee/home/model/item.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:beco_coffee/home/repo/location_repo.dart';
import 'package:beco_coffee/home/repo/order_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlng/latlng.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_detail_notifier.g.dart';

@riverpod
FutureOr<(Order?, String, String)> orderDetail(Ref ref) async {
  final order = await ref.watch(orderNotifierProvider.future);
  final currentBank =
      await ref.watch(checkoutNotifierProvider.notifier).currentPayment();

  final latLng = order?.transaction_address ?? LatLng.degree(0, 0);

  final address = await ref
      .read(locationRepoProvider)
      .getAddress(latLng.latitude.degrees, latLng.longitude.degrees);

  return (order, currentBank, address);
}
