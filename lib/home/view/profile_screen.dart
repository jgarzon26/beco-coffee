import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSettingsTile {
  final String title;
  final IconData leading;

  ProfileSettingsTile({
    required this.title,
    required this.leading,
  });
}

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileSettings = [
      ProfileSettingsTile(title: 'My Information', leading: Icons.person),
      ProfileSettingsTile(title: 'Address', leading: Icons.location_on),
      ProfileSettingsTile(
          title: 'Payment', leading: Icons.credit_card_outlined),
      ProfileSettingsTile(title: 'My Wishlist', leading: Icons.favorite_border),
      ProfileSettingsTile(title: 'Cafe Following', leading: Icons.store),
      ProfileSettingsTile(title: 'Refund', leading: Icons.attach_money),
      ProfileSettingsTile(title: 'Password', leading: Icons.lock),
      ProfileSettingsTile(title: 'Settings', leading: Icons.settings),
      ProfileSettingsTile(title: 'Policy and Privacy', leading: Icons.info),
      ProfileSettingsTile(title: 'Sign Out', leading: Icons.logout),
    ];

    return Stack(
      children: [
        Container(
          color: kPrimaryContainer,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: ListView.separated(
            itemCount: profileSettings.length,
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(),
              );
            },
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                leading: Icon(profileSettings[index].leading),
                title: Text(
                  profileSettings[index].title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                      ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
