import 'dart:convert';

import 'package:latlng/latlng.dart';

class BecoOffice {
  final String office_id;
  final String office_location;
  final LatLng latlng;

  const BecoOffice({
    required this.office_id,
    required this.office_location,
    required this.latlng,
  });

  BecoOffice copyWith({
    String? office_id,
    String? office_location,
    LatLng? latlng,
  }) {
    return BecoOffice(
      office_id: office_id ?? this.office_id,
      office_location: office_location ?? this.office_location,
      latlng: latlng ?? this.latlng,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'office_id': office_id});
    result.addAll({'office_location': office_location});
    result.addAll({'latlng': {'lat': latlng.latitude.degrees, 'lng': latlng.longitude.degrees}});

    return result;
  }

  factory BecoOffice.fromMap(Map<String, dynamic> map) {
    return BecoOffice(
      office_id: map['office_id'] ?? '',
      office_location: map['office_location'] ?? '',
      latlng: LatLng(Angle.degree(map['latlng']['lat']), Angle.degree(map['latlng']['lng'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory BecoOffice.fromJson(String source) =>
      BecoOffice.fromMap(json.decode(source));
}
