import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'checkout_repo.g.dart';

class CheckoutRepo {
  final supabase = Supabase.instance.client;

  Future<List<String>> getBecoOfficeLocations() async {
    final response = await supabase.from('beco_office').select();

    final List<String> locations = response.map(
      (location) {
        return location['office_location'].toString();
      },
    ).toList();

    return locations;
  }
}

@riverpod
CheckoutRepo checkoutRepo(Ref ref) {
  return CheckoutRepo();
}
