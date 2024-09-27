import 'package:basic_utils/basic_utils.dart';
import 'package:beco_coffee/auth/widgets/auth_form_background.dart';
import 'package:beco_coffee/auth/widgets/auth_help_row_sign_up.dart';
import 'package:beco_coffee/auth/widgets/auth_widgets.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CodeVerifyScreen extends StatefulWidget {
  const CodeVerifyScreen({super.key});

  @override
  State<CodeVerifyScreen> createState() => _CodeVerifyScreenState();
}

class _CodeVerifyScreenState extends State<CodeVerifyScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _code = List.filled(4, '');
  bool _canSignUp = false;

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
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        counterText: '',
                      ),
                      style: textTheme.labelLarge!.copyWith(
                        fontSize: 45,
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                          _code[index] = value;
                        } else {
                          _code[index] = '';
                        }

                        if (_code.contains('')) {
                          setState(() {
                            _canSignUp = false;
                          });
                        } else {
                          setState(() {
                            _canSignUp = true;
                          });
                        }
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                );
              },
              growable: false,
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
            isAuthButtonEnable: _canSignUp,
            formKey: _formKey,
            constraints: constraints,
            text: 'Sign Up',
            onPressed: () {
              String finalCode = '';

              for (var element in _code) {
                finalCode += element;
              }

              //TODO: verify the code in backend and go to create password

              context.goNamed('password-create');
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
