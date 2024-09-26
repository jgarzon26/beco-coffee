import 'package:beco_coffee/auth/widgets/auth_help_row.dart';
import 'package:flutter/material.dart';

class AuthHelpRowSignUp extends StatelessWidget {
  const AuthHelpRowSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthHelpRow(
      questionText: 'You have any problem?',
      label: 'Help',
      onPressed: () {
        //TODO: go to help page
      },
    );
  }
}
