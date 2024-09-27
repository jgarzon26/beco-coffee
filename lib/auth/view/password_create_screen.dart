import 'package:beco_coffee/auth/widgets/auth_button.dart';
import 'package:beco_coffee/auth/widgets/auth_form_background.dart';
import 'package:beco_coffee/auth/widgets/auth_form_field.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';

class PasswordCreateScreen extends StatefulWidget {
  const PasswordCreateScreen({super.key});

  @override
  State<PasswordCreateScreen> createState() => _PasswordCreateScreenState();
}

class _PasswordCreateScreenState extends State<PasswordCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthFormBackground(
      formKey: _formKey,
      builder: (context, constraints) {
        return [
          Text(
            'Create Password',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 20),
          AuthFormField(
            label: 'Password',
            iconData: Icons.lock_outline,
            onChanged: (value) {},
            onSaved: (newValue) {},
          ),
          const SizedBox(height: 20),
          AuthFormField(
            label: 'Confirm Password',
            iconData: Icons.lock_outline,
            onChanged: (value) {},
            onSaved: (newValue) {},
          ),
          const SizedBox(height: 20),
          Text(
            'Password must be at least 8 characters',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kOnPrimaryContainer,
                ),
          ),
          const Spacer(),
          AuthButton(
            formKey: _formKey,
            constraints: constraints,
            text: 'Create',
          ),
          const Spacer(),
        ];
      },
    );
  }
}
