import 'package:beco_coffee/core/routes.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  await Supabase.initialize(
    url: 'https://fwcldopzpykdcinlwenw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ3Y2xkb3B6cHlrZGNpbmx3ZW53Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzNTkzOTQsImV4cCI6MjA1MDkzNTM5NH0.gqRanv0J5Tg2DhxjH9uFZCqCdOL-aISM03OHn2vEkZ8',
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.watch(routerProvider);

    return MaterialApp.router(
      theme: defaultTheme,
      title: 'beCo Coffee',
      routerConfig: routes,
    );
  }
}
