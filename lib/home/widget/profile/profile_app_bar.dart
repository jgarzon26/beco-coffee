import 'package:beco_coffee/auth/controller/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final BuildContext context;

  const ProfileAppBar({super.key, required this.context});

  @override
  Size get preferredSize => Size.fromHeight(
        MediaQuery.sizeOf(context).height * 0.25,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authNotifierProvider);

    String userAt;

    if (authUser.hasValue) {
      userAt = authUser.value!.userProfile.email.isNotEmpty
          ? authUser.value!.userProfile.email
          : authUser.value!.userProfile.phone;
    } else {
      userAt = '';
    }

    return AppBar(
      toolbarHeight: 150,
      actions: [
        TextButton(
          onPressed: () {},
          child: Image.asset('assets/icon/wallet.png'),
        ),
        IconButton(
          iconSize: 50,
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage(
              'assets/icon/bell.png',
            ),
          ),
        ),
      ],
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 90),
            Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                ),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authUser.value?.userProfile.fullName ?? '',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '@ $userAt',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
