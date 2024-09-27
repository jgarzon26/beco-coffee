import 'dart:io';

import 'package:beco_coffee/auth/controller/auth_notifier.dart';
import 'package:beco_coffee/auth/widgets/auth_help_row_sign_up.dart';
import 'package:beco_coffee/auth/widgets/auth_widgets.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLogin = true;

  String? _emailOrPhone, _password;
  String? _fullName, _address;
  bool _isObscure = true;
  bool _isRememberMe = false;
  bool _isTOSCheck = false;

  final _inputChecks = [false, false];

  bool _isAuthButtonEnable = false;

  void _resetBooleanValues() {
    if (_isLogin) {
      _isTOSCheck = false;
      _inputChecks.clear();
      _inputChecks.addAll([false, false]);
    } else {
      _isObscure = true;
      _inputChecks.clear();
      _inputChecks.addAll([false, false, false, false]);
    }

    _isAuthButtonEnable = false;
  }

  void _notifyInputCheck() {
    if (!_inputChecks.contains(false) && _isAuthButtonEnable == false) {
      setState(() {
        _isAuthButtonEnable = true;
      });
    } else if (_inputChecks.contains(false) && _isAuthButtonEnable) {
      setState(() {
        _isAuthButtonEnable = false;
      });
    }
  }

  //* Build

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.inter(),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: !_isLogin
              ? IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  iconSize: 40,
                  onPressed: () {
                    _formKey.currentState!.reset();
                    setState(() {
                      _isLogin = true;
                    });
                    _resetBooleanValues();
                  },
                  icon: Icon(
                    Platform.isIOS
                        ? Icons.arrow_back_ios_new
                        : Icons.arrow_back,
                  ),
                )
              : null,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: AuthBackground(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 25,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      minWidth: constraints.maxWidth,
                    ),
                    child: Form(
                      key: _formKey,
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            AnimatedSize(
                              duration: Durations.medium2,
                              curve: Curves.easeIn,
                              child: SizedBox.fromSize(
                                size: Size.fromHeight(
                                  !_isLogin ? constraints.maxHeight * 0.05 : 0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(70),
                              child: Image.asset(
                                'assets/img/logo/logo_2.png',
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                            _buildAuthCredential(),
                            _isLogin
                                ? _buildUserOperations(context)
                                : _buildTOSandPolicy(),
                            const Spacer(flex: 3),
                            Flexible(
                              child: AnimatedCrossFade(
                                crossFadeState: _isLogin
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: Durations.medium2,
                                firstChild: AuthButton(
                                  isAuthButtonEnable: _isAuthButtonEnable,
                                  formKey: _formKey,
                                  constraints: constraints,
                                  text: 'Sign In',
                                  onPressed: () {
                                    //TODO: sign in the user to backend
                                  },
                                ),
                                secondChild: Consumer(
                                  builder: (context, ref, child) {
                                    return AuthButton(
                                      isAuthButtonEnable: _isAuthButtonEnable,
                                      formKey: _formKey,
                                      constraints: constraints,
                                      text: 'Sign Up',
                                      onPressed: () {
                                        ref
                                            .read(authNotifierProvider.notifier)
                                            .initUserCredentialForSignUp(
                                              fullName: _fullName!,
                                              address: _address!,
                                              email:
                                                  _emailOrPhone!.contains('@')
                                                      ? _emailOrPhone
                                                      : null,
                                              number:
                                                  _emailOrPhone!.contains('@')
                                                      ? null
                                                      : _emailOrPhone,
                                            );

                                        //? firebase might accept number rather string
                                        context.goNamed('verify-code');
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            AnimatedCrossFade(
                              firstChild: Column(
                                children: [
                                  _buildSignInDivider(context, constraints),
                                  const SizedBox(height: 20),
                                  _buildAccountIcons(),
                                ],
                              ),
                              secondChild: Container(),
                              crossFadeState: _isLogin
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: Durations.medium2,
                            ),
                            AnimatedCrossFade(
                              crossFadeState: _isLogin
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: Durations.medium2,
                              firstChild: AuthHelpRow(
                                questionText: 'Don\'t have an account?',
                                label: 'Sign Up',
                                onPressed: () {
                                  _formKey.currentState!.reset();
                                  setState(() {
                                    _isLogin = false;
                                  });
                                  _resetBooleanValues();
                                },
                              ),
                              secondChild: const AuthHelpRowSignUp(),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }

  Widget _buildSignInDivider(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    return SizedBox(
      width: constraints.maxWidth * 0.7,
      child: Row(
        children: [
          const Expanded(child: Divider()),
          const SizedBox(width: 10),
          Text(
            'or sign in with',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kOnPrimaryContainer,
                ),
          ),
          const SizedBox(width: 10),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }

  Widget _buildTOSandPolicy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'I agree with',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kOnPrimaryContainer,
                fontSize: 10,
              ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
          ),
          onPressed: () {
            // TODO go to TOS
          },
          child: Text(
            'Terms of Services',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kSecondaryContainer,
                  fontSize: 10,
                ),
          ),
        ),
        Text(
          'and',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kOnPrimaryContainer,
                fontSize: 10,
              ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
          ),
          onPressed: () {
            //TODO go to Policy Privacy
          },
          child: Text(
            'Policy Privacy',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kSecondaryContainer,
                  fontSize: 10,
                ),
          ),
        ),
        StatefulBuilder(
          builder: (context, setState) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _isTOSCheck = !_isTOSCheck;
                });

                _inputChecks[3] = _isTOSCheck;
                _notifyInputCheck();
              },
              child: Icon(
                _isTOSCheck
                    ? Icons.check_box_outlined
                    : Icons.check_box_outline_blank_outlined,
                size: 10.5,
                color: kOnPrimaryContainer,
              ),
            );
          },
        ),
      ],
    );
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

  Widget _buildAuthCredential() {
    return Column(
      children: [
        AnimatedCrossFade(
          crossFadeState:
              _isLogin ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Durations.medium2,
          firstChild: AuthFormField(
            label: 'Email or Phone',
            keyBoardType: TextInputType.emailAddress,
            iconData: Icons.email_outlined,
            onChanged: (value) {
              if (value == null || value.trim().isEmpty) {
                _inputChecks[0] = false;
              } else {
                _inputChecks[0] = true;
              }

              _notifyInputCheck();
            },
            onSaved: (newValue) => _emailOrPhone = newValue,
          ),
          secondChild: AuthFormField(
            label: 'Full Name',
            iconData: Icons.person_3_outlined,
            onChanged: (value) {
              if (value == null || value.trim().isEmpty) {
                _inputChecks[0] = false;
              } else {
                _inputChecks[0] = true;
              }
              _notifyInputCheck();
            },
            onSaved: (newValue) => _fullName = newValue,
          ),
        ),
        const SizedBox(height: 20),
        AnimatedCrossFade(
          crossFadeState:
              _isLogin ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Durations.medium2,
          firstChild: StatefulBuilder(
            builder: (context, setState) {
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
                onChanged: (value) {
                  if (value == null || value.trim().isEmpty) {
                    _inputChecks[1] = false;
                  } else {
                    _inputChecks[1] = true;
                  }

                  _notifyInputCheck();
                },
                onSaved: (newValue) {
                  _password = newValue;
                },
              );
            },
          ),
          secondChild: AuthFormField(
            label: 'Email or Phone',
            iconData: Icons.email_outlined,
            keyBoardType: TextInputType.emailAddress,
            onChanged: (value) {
              if (value == null || value.trim().isEmpty) {
                _inputChecks[1] = false;
              } else {
                _inputChecks[1] = true;
              }

              _notifyInputCheck();
            },
            onSaved: (newValue) => _emailOrPhone = newValue,
          ),
        ),
        const SizedBox(height: 20),
        AnimatedCrossFade(
          crossFadeState:
              !_isLogin ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Durations.medium2,
          firstChild: AuthFormField(
            label: 'Address',
            iconData: Icons.location_on_outlined,
            onSaved: (newValue) => _address = newValue,
            onChanged: (value) {
              if (_isLogin) return;

              if (value == null || value.trim().isEmpty) {
                _inputChecks[2] = false;
              } else {
                _inputChecks[2] = true;
              }

              _notifyInputCheck();
            },
          ),
          secondChild: Container(),
        ),
      ],
    );
  }
}
