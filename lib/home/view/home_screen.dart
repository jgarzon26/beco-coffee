import 'package:beco_coffee/home/controller/search_notifier.dart';
import 'package:beco_coffee/home/page/home_page.dart';
import 'package:beco_coffee/home/page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchNotifierProvider.select(
      (value) => value.isSearching,
    ));

    if(searchState) {
      return const SearchPage();
    }

    return const HomePage();
  }
}
