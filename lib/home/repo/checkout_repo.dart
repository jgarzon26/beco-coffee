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
Future<List<String>> checkoutOptions(Ref ref) async {
  final officeLocations = await ref.watch(becoOfficeLocationsProvider.future);

  return officeLocations;
}