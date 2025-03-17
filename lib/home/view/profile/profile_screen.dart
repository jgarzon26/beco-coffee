import 'package:beco_coffee/auth/controller/auth_notifier.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileSettingsTile {
  final String title;
  final IconData leading;
  final VoidCallback? onTap;
  final String? routeName;

  const ProfileSettingsTile({
    required this.title,
    required this.leading,
    this.routeName,
    this.onTap,
  });
}

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileSettings = [
      const ProfileSettingsTile(
        title: 'My Information',
        leading: Icons.person,
        routeName: 'my-info-screen',
      ),
      const ProfileSettingsTile(title: 'Address', leading: Icons.location_on),
      const ProfileSettingsTile(
        title: 'Payment',
        leading: Icons.credit_card_outlined,
      ),
      const ProfileSettingsTile(
        title: 'My Wishlist',
        leading: Icons.favorite_border,
        routeName: 'wishlist',
      ),
      const ProfileSettingsTile(title: 'Cafe Following', leading: Icons.store),
      const ProfileSettingsTile(title: 'Refund', leading: Icons.attach_money),
      const ProfileSettingsTile(title: 'Password', leading: Icons.lock),
      const ProfileSettingsTile(title: 'Settings', leading: Icons.settings),
      const ProfileSettingsTile(
        title: 'About Us',
        leading: Icons.info,
        routeName: 'about-us',
      ),
      ProfileSettingsTile(
          title: 'Sign Out',
          leading: Icons.logout,
          onTap: () async {
            await ref.read(authNotifierProvider.notifier).logOut();
          }),
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
                onTap: profileSettings[index].onTap ??
                    () {
                      context
                          .pushNamed(profileSettings[index].routeName ?? '/');
                    },
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
