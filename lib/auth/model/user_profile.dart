
class UserProfile {
  final String email;
  final String fullName;
  final String address;
  final String phone;

  const UserProfile({
    required this.email,
    required this.fullName,
    required this.address,
    required this.phone,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      email: map['email'] ?? '',
      fullName: map['full_name'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone_number'] ?? '',
    );
  }
}
