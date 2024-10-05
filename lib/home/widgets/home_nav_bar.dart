import 'package:beco_coffee/constants/nav_icons.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

class HomeNavBar extends StatelessWidget {
  final StatefulNavigationShell statefulNavigationShell;

  const HomeNavBar({
    super.key,
    required this.statefulNavigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
