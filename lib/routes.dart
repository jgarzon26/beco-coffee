import 'package:beco_coffee/auth/view/auth_screen.dart';
import 'package:beco_coffee/home/view/home_screen.dart';
import 'package:beco_coffee/intro/view/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage _buildPageWithCustomTransitionPage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  Duration? duration,
  Widget? transitionWidget,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: duration ?? const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return transitionWidget ??
          FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
            child: child,
          );
    },
  );
}

final routes = GoRouter(
  initialLocation: '/intro',
  routes: [
    GoRoute(
      name: 'intro',
      path: '/intro',
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      name: 'auth',
      path: '/auth',
      pageBuilder: (context, state) => _buildPageWithCustomTransitionPage(
        context: context,
        state: state,
        child: const AuthScreen(),
      ),
    ),
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
