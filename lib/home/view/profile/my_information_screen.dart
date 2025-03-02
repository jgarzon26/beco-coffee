import 'package:beco_coffee/common/information_tile.dart';
import 'package:beco_coffee/home/widget/profile/information_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:beco_coffee/auth/controller/auth_notifier.dart';

class MyInformationScreen extends ConsumerWidget {
  const MyInformationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Information'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
            onPressed: () {},
            child: const Text('Edit'),
          ),
        ],
      ),
      body: userProfile.when(
        data: (coffeeUser) {
          final userProfile = coffeeUser!.userProfile;

          final List<InformationTile> informationTile = [
            InformationTile(
              icon: Icons.person,
              title: 'FullName',
              value: userProfile.fullName,
            ),
            InformationTile(
              imageSrc: 'assets/icon/profile/at-sign.png',
              title: 'Email',
              value: userProfile.email,
            ),
            InformationTile(
              icon: Icons.phone,
              title: 'Phone Number',
              value: userProfile.phone,
            ),
            InformationTile(
              imageSrc: 'assets/icon/profile/male.png',
              title: 'Gender',
              value: userProfile.gender,
            ),
            InformationTile(
              imageSrc: 'assets/icon/profile/schedule.png',
              title: 'Birthday',
              value: userProfile.birthDate != null
                  ? DateFormat.yMd(userProfile.birthDate).toString()
                  : '',
            ),
          ];
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: informationTile.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final info = informationTile[index];
              return InformationListTile(
                info: info,
              );
            },
          );
        },
        error: (e, st) => Container(),
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
