import 'package:beco_coffee/auth/view/auth_screen.dart';
import 'package:beco_coffee/home/view/home_screen.dart';
import 'package:beco_coffee/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainWidget extends ConsumerWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    return authState.when(
      data: (data) {
        if (data == null) {
          return const AuthScreen();
        }

        return const HomeScreen();
      },
      error: (error, stackTrace) {
        return const Placeholder();
      },
      loading: () {
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
