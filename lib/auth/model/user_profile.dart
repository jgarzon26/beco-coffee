import 'dart:convert';

enum Gender {
  male,
  female,
}

class UserProfile {
  final String email;
  final String fullName;
  final String address;
  final String phone;
  final String profilePicUrl;
  final DateTime? birthDate;
  final Gender? gender;

  const UserProfile({
    required this.email,
    required this.fullName,
    required this.address,
    required this.phone,
    required this.profilePicUrl,
    required this.birthDate,
    required this.gender,
  });

  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'email': email});
    result.addAll({'full_name': fullName});
    result.addAll({'address': address});
    result.addAll({'phone_number': phone});
    result.addAll({'profile_pic': profilePicUrl});
    result.addAll({'birth_date': birthDate?.toIso8601String()});
    result.addAll({'gender': gender?.name});
  
    return result;
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      email: map['email'] ?? '',
      fullName: map['full_name'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone_number'] ?? '',
      profilePicUrl: map['profile_pic'] ?? '',
      birthDate: DateTime.tryParse(map['birth_date'] ?? ''),
      gender: map['gender'] != null ? Gender.values.byName(map['gender']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) => UserProfile.fromMap(json.decode(source));
}
