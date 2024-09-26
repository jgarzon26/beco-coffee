import 'package:beco_coffee/auth/widgets/auth_form_background.dart';
import 'package:beco_coffee/auth/widgets/auth_help_row_sign_up.dart';
import 'package:beco_coffee/auth/widgets/auth_widgets.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CodeVerifyScreen extends StatefulWidget {
  const CodeVerifyScreen({super.key});

  @override
  State<CodeVerifyScreen> createState() => _CodeVerifyScreenState();
}

class _CodeVerifyScreenState extends State<CodeVerifyScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AuthFormBackground(
      formKey: _formKey,
      builder: (context, constraints) {
        return [
          Text(
            'Verify Code',
            style: textTheme.displayMedium!.copyWith(
              color: kOnPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Check SMS or Email for your code',
            style: textTheme.bodyLarge!.copyWith(
              color: const Color(0xffff6262),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: List.generate(
              4,
              (index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        counterText: '',
                      ),
                      style: textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t receive code?',
                style: textTheme.bodyMedium!.copyWith(
                  color: kOnPrimaryContainer,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sent again',
                  style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xffff6262),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(flex: 2),
          AuthButton(
            formKey: _formKey,
            constraints: constraints,
            text: 'Sign Up',
            onPressed: () {
              //context.go('/auth/verify-code');
            },
          ),
          const Spacer(),
          const AuthHelpRowSignUp(),
          const Spacer(),
        ];
      },
    );
  }
}
