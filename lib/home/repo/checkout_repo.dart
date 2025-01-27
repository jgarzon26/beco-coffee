import 'package:beco_coffee/home/controller/order_notifier.dart';
import 'package:beco_coffee/home/model/order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'checkout_repo.g.dart';

final _supabase = Supabase.instance.client;

@riverpod
FutureOr<List<String>> becoOfficeLocations(Ref ref) async {
  final response = await _supabase.from('beco_office').select();

  final List<String> locations = response.map(
    (location) {
      return location['office_location'].toString();
    },
  ).toList();

  return locations;
}

@riverpod
FutureOr<List<String>> becobankNames(Ref ref) async {
  final response = await _supabase.from('beco_payment').select();

  final List<String> locations = response.map(
    (location) {
      return location['beco_bank_name'].toString();
    },
  ).toList();

  return locations;
}

@riverpod
Future<(List<String>, List<String>)> checkoutOptions(Ref ref) async {
  final officeLocations = await ref.watch(becoOfficeLocationsProvider.future);
  final becoBankNames = await ref.watch(becobankNamesProvider.future);

  return (officeLocations, becoBankNames);
}
