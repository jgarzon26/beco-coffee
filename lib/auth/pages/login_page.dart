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
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 25,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Form(
            key: _formKey,
            child: IntrinsicHeight(
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
                  _buildEmailAndPassword(),
                  const SizedBox(height: 10),
                  _buildUserOperations(context),
                  const Spacer(flex: 3),
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: kSecondaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildUserOperations(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StatefulBuilder(
          builder: (context, setstate) {
            return TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(left: 5),
              ),
              onPressed: () {
                setstate(() => _isRememberMe = !_isRememberMe);
                //TODO: make app remember this user
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Remember me',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: kOnPrimaryContainer,
                          fontSize: 10,
                        ),
                  ),
                  const SizedBox(width: 2),
                  Icon(
                    _isRememberMe
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank,
                    color: kOnPrimaryContainer,
                    size: 10.5,
                  ),
                ],
              ),
            );
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(right: 5),
          ),
          onPressed: () {
            //TODO: go to forgot password screen
          },
          child: Text(
            'Forgot password?',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kOnPrimaryContainer,
                  fontSize: 10,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailAndPassword() {
    return Column(
      children: [
        AuthFormField(
          label: 'Email or Phone',
          iconData: Icons.email_outlined,
          validator: (value) {
            if (value == null || value.trim().isEmpty || !value.contains('@')) {
              return 'Input a valid email';
            }

            return null;
          },
          onSaved: (newValue) => _email = newValue,
        ),
        const SizedBox(height: 20),
        StatefulBuilder(builder: (context, setState) {
          return AuthFormField(
            label: 'Password',
            obscureText: _isObscure,
            icon: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                overlayColor: Colors.transparent,
              ),
              onPressed: () => setState(() {
                _isObscure = !_isObscure;
              }),
              icon: Icon(
                _isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
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
          );
        }),
      ],
    );
  }
}
