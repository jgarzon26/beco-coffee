import 'package:beco_coffee/home/view/home_screen.dart';
import 'package:beco_coffee/intro/view/intro_screen.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(
    const Duration(milliseconds: 1000),
    () {
      FlutterNativeSplash.remove();
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: defaultTheme,
      title: 'beCo Coffee',
      routerConfig: routes,
    );
  }
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
      name: 'home',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
