import 'package:beco_coffee/auth/widgets/auth_button.dart';
import 'package:beco_coffee/auth/widgets/auth_form_background.dart';
import 'package:beco_coffee/auth/widgets/auth_form_field.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordCreateScreen extends StatefulWidget {
  const PasswordCreateScreen({super.key});

  @override
  State<PasswordCreateScreen> createState() => _PasswordCreateScreenState();
}

class _PasswordCreateScreenState extends State<PasswordCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _password, _confirmPassword;
  bool _canSignUp = false;

  @override
  Widget build(BuildContext context) {
    return AuthFormBackground(
      formKey: _formKey,
      builder: (context, constraints) {
        return [
          Text(
            'Create Password',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: kOnPrimaryContainer,
                ),
          ),
          const SizedBox(height: 40),
          AuthFormField(
            label: 'Password',
            iconData: Icons.lock_outline,
            obscureText: true,
            onChanged: (value) {
              _password = value;

              if (_password == _confirmPassword) {
                setState(() {
                  _canSignUp = true;
                });
              } else {
                setState(() {
                  _canSignUp = false;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          AuthFormField(
            label: 'Confirm Password',
            iconData: Icons.lock_outline,
            obscureText: true,
            onChanged: (value) {
              _confirmPassword = value;

              if (_confirmPassword == null) {
                setState(() {
                  _canSignUp = false;
                });
                return;
              }

              if (_confirmPassword!.trim().length < 8) {
                setState(() {
                  _canSignUp = false;
                });
                return;
              }

              if (_password == _confirmPassword) {
                setState(() {
                  _canSignUp = true;
                });
              } else {
                setState(() {
                  _canSignUp = false;
                });
              }
            },
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password must be at least 8 characters',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kOnPrimaryContainer,
                  ),
            ),
          ),
          const Spacer(),
          AuthButton(
            isAuthButtonEnable: _canSignUp,
            formKey: _formKey,
            constraints: constraints,
            text: 'Create',
            onPressed: () {
              //TODO: sign up the user

              context.goNamed('sign-up');
            },
          ),
          const Spacer(),
        ];
      },
    );
  }
}
