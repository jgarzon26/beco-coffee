import 'package:beco_coffee/auth/widgets/account_icon_button.dart';
import 'package:beco_coffee/auth/widgets/auth_form_field.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email, _password;
  bool _isObscure = true;
  bool _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    final passwordIcon = IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
      ),
      onPressed: () => setState(() {
        _isObscure = !_isObscure;
      }),
      icon: Icon(
        _isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
      ),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 25,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(60),
              child: Image.asset(
                'assets/img/logo/logo_2.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            AuthFormField(
              label: 'Email or Phone',
              iconData: Icons.email_outlined,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    !value.contains('@')) {
                  return 'Input a valid email';
                }

                return null;
              },
              onSaved: (newValue) => _email = newValue,
            ),
            const SizedBox(height: 20),
            AuthFormField(
              label: 'Password',
              obscureText: _isObscure,
              icon: passwordIcon,
              shouldIconDisappearOnEdit: false,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Input a password';
                }

                return null;
              },
              onSaved: (newValue) {
                _password = newValue;
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatefulBuilder(
                  builder: (context, setstate) {
                    return TextButton.icon(
                      onPressed: () {
                        setstate(() => _isRememberMe = !_isRememberMe);
                      },
                      iconAlignment: IconAlignment.end,
                      label: const Text('Remember me'),
                      icon: Icon(
                        _isRememberMe
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank,
                      ),
                    );
                  },
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }

                _formKey.currentState!.save();

                //TODO: login the user from backend
              },
              child: const Text(
                'Sign In',
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Expanded(child: Divider()),
                Text('or sign in with'),
                Expanded(child: Divider()),
              ],
            ),
            Row(
              children: [
                AccountIconButton(
                  asset: 'assets/icon/google.png',
                  onPressed: () {},
                ),
                AccountIconButton(
                  asset: 'assets/icon/facebook.png',
                  onPressed: () {},
                ),
                AccountIconButton(
                  asset: 'assets/icon/twitter.png',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    //TODO: go to sign up page
                  },
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: kSecondaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
