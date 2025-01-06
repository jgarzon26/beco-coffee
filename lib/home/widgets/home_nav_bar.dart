import 'package:beco_coffee/auth/controller/auth_notifier.dart';
import 'package:beco_coffee/constants/nav_icons.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

class HomeNavBar extends ConsumerWidget {
  final StatefulNavigationShell statefulNavigationShell;

  const HomeNavBar({
    super.key,
    required this.statefulNavigationShell,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    if (authState.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.transparent),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logOut().then(
                (_) {
                  context.goNamed('auth');
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: statefulNavigationShell,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: kPrimaryContainer,
        ),
        child: BottomNavigationBar(
          currentIndex: statefulNavigationShell.currentIndex,
          unselectedItemColor: kOnPrimaryContainer,
          selectedItemColor: kSecondaryContainer,
          items: [
            for (final navIcon in navIcons)
              BottomNavigationBarItem(
                icon: Iconify(
                  navIcon.iconUrl,
                  color: kOnPrimaryContainer,
                ),
                label: navIcon.label,
                activeIcon: Iconify(
                  navIcon.iconUrl,
                  color: kSecondaryContainer,
                ),
              ),
          ],
          onTap: (index) {
            statefulNavigationShell.goBranch(
              index,
              initialLocation: index == statefulNavigationShell.currentIndex,
            );
          },
        ),
      ),
    );
  }
}
