import 'package:beco_coffee/auth/controller/auth_notifier.dart';
import 'package:beco_coffee/auth/widgets/auth_background.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpLoadingScreen extends ConsumerWidget {
  const SignUpLoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AuthBackground(
        child: Center(
          child: authState.when(
            data: ((data) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Icon(
                    Icons.check_circle_outline,
                    color: Color(0xFFE40052),
                    size: 200,
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'You have successfully create an account',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: kOnPrimaryContainer,
                              ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryContainer,
                        foregroundColor: kOnPrimaryContainer,
                        disabledBackgroundColor: Colors.black54,
                        disabledForegroundColor: Colors.white38,
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                      ),
                      onPressed: () {
                        //TODO: login the user and enter the homepage
                      },
                      child: const Text('Log In'),
                    ),
                  ),
                  const Spacer(),
                ],
              );
            }),
            error: ((error, stackTrace) {
              return const Text(
                'Cannot Sign Up',
                style: TextStyle(color: Colors.white),
              );
            }),
            loading: (() {
              return const CircularProgressIndicator.adaptive();
            }),
          ),
        ),
      ),
    );
  }
}
