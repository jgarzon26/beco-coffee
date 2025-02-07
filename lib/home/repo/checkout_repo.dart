import 'package:beco_coffee/home/model/beco_office.dart';
import 'package:beco_coffee/home/repo/location_repo.dart';
import 'package:beco_coffee/utilities/user_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'checkout_repo.g.dart';

final _supabase = Supabase.instance.client;

@riverpod
FutureOr<List<BecoOffice>> becoOfficeLocations(Ref ref) async {
  final response = await _supabase.from('beco_office').select();

  final List<BecoOffice> locations = response.map(
    (location) {
      return BecoOffice.fromMap(location);
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
Future<(List<BecoOffice>, List<String>, String)> checkoutOptions(
  Ref ref,
) async {
  final officeLocations = await ref.watch(becoOfficeLocationsProvider.future);
  final becoBankNames = await ref.watch(becobankNamesProvider.future);
  final userLocation = await getUserLocation();

  String address = '';

  if (userLocation != null) {
    address = await ref
        .read(locationRepoProvider)
        .getAddress(userLocation.latitude!, userLocation.longitude!);
  }

  return (
    officeLocations,
    becoBankNames,
    address,
  );
}
