import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'location_repo.g.dart';

class LocationRepo {
  final _geoCodeApi = 'AIzaSyDo48gQJucGYsTlfLPtthm9Xeynq5N2gks';

  Future<String> getAddress(double latitude, double longitude) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$_geoCodeApi');

    final response = await http.get(url);
    final resData = json.decode(response.body);

    final address = resData['results'][0]['formatted_address'] as String;

    return address;
  }
}

@riverpod
LocationRepo locationRepo(Ref ref) {
  return LocationRepo();
}
