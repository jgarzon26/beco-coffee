import 'package:beco_coffee/auth/controller/auth_notifier.dart';
import 'package:beco_coffee/constants/nav_icons.dart';
import 'package:beco_coffee/home/controller/search_notifier.dart';
import 'package:beco_coffee/home/widget/search_app_bar.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

class HomeNavBar extends ConsumerWidget {
  final GoRouterState state;
  final StatefulNavigationShell statefulNavigationShell;

  const HomeNavBar({
    super.key,
    required this.state,
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

    final PreferredSizeWidget? appBar = switch (state.fullPath) {
      '/home' => const SearchAppBar(
          hasNotifications: false,
        ),
      String() => null,
      null => null,
    };

    return Scaffold(
      appBar: appBar,
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
            ref.read(searchNotifierProvider.notifier).setSearchState(false);
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
