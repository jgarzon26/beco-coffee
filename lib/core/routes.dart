import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:beco_coffee/core/route_imports.dart';

part 'routes.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

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
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
    },
  );
}

@riverpod
GoRouter router(Ref ref) {
  final user = ref.watch(authRepoProvider).currentUser;

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/intro',
    routes: [
      GoRoute(
        name: 'intro',
        path: '/intro',
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        name: 'main',
        path: '/main',
        builder: (context, state) => const MainWidget(),
      ),
      GoRoute(
        name: 'auth',
        path: '/auth',
        pageBuilder: (context, state) => _buildPageWithCustomTransitionPage(
          context: context,
          state: state,
          child: const AuthScreen(),
        ),
        redirect: (context, state) {
          if (user != null) {
            return '/home';
          }

          return null;
        },
        routes: [
          GoRoute(
            name: 'verify-code',
            path: 'verify-code',
            builder: (context, state) => const CodeVerifyScreen(),
          ),
          GoRoute(
            name: 'password-create',
            path: 'password-create',
            builder: (context, state) => const PasswordCreateScreen(),
          ),
          GoRoute(
            name: 'sign-up',
            path: 'sign-up',
            builder: (context, state) => const SignUpLoadingScreen(),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeNavBar(
            state: state,
            statefulNavigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: [
              GoRoute(
                name: 'home',
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: 'order',
                path: '/order',
                builder: (context, state) => const Placeholder(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: 'chat',
                path: '/chat',
                builder: (context, state) => const Placeholder(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: 'cart',
                path: '/cart',
                builder: (context, state) => const CartScreen(),
                routes: [
                  GoRoute(
                    name: 'checkout',
                    path: 'checkout',
                    builder: (context, state) => const CheckoutScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: 'profile',
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    name: 'wishlist',
                    path: 'wishlist',
                    builder: (context, state) => const WishlistScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: 'product-detail',
        path: '/product-detail',
        builder: (context, state) {
          final coffee = state.extra as Coffee;
          return ProductDetailScreen(coffee: coffee);
        },
      ),
      GoRoute(
        name: 'paid-screen',
        path: '/paid-screen',
        builder: (context, state) => const OrderPaidScreen(),
      ),
      GoRoute(
        name: 'waiting',
        path: '/waiting',
        builder: (context, state) => const WaitingScreen(),
        routes: [
          GoRoute(
            name: 'pickup-done',
            path: 'pickup-done',
            builder: (context, state) => const PickupDoneScreen(),
          ),
          GoRoute(
            name: 'delivery',
            path: 'delivery',
            builder: (context, state) => const DeliveryScreen(),
          ),
        ],
      ),
      GoRoute(
        name: 'order-detail',
        path: '/order-detail',
        builder: (context, state) => const OrderDetailScreen(),
      ),
    ],
  );
}
