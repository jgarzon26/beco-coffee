import 'package:beco_coffee/auth/controller/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

typedef Validator = String? Function(String? value);

class PasswordDetail {
  final String name;
  String? value;
  bool isVisible;

  PasswordDetail({
    required this.name,
    this.value,
    this.isVisible = true,
  });
}

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();

  var currentPass = PasswordDetail(name: 'Current Password'),
      newPass = PasswordDetail(name: 'New Password'),
      confirmPass = PasswordDetail(name: 'Confirm Password');

  InputDecoration buildInputDecoration(
    PasswordDetail passwordDetail,
    void Function(void Function()) setState,
  ) {
    const eyeOn = AssetImage('assets/icon/profile/eye-thin.png'),
        eyeOff = AssetImage('assets/icon/profile/eye-thin-off.png');

    return InputDecoration(
      hintText: passwordDetail.name,
      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.black.withValues(alpha: 0.3),
          ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color.fromRGBO(240, 240, 240, 1),
      suffixIcon: IconButton(
        onPressed: () => setState(
            () => passwordDetail.isVisible = !passwordDetail.isVisible),
        icon: ImageIcon(
          passwordDetail.isVisible ? eyeOn : eyeOff,
          color:
              passwordDetail.value != null && passwordDetail.value!.isNotEmpty
                  ? Colors.black
                  : Colors.black45,
        ),
      ),
    );
  }

  Widget buildFormField({
    required PasswordDetail passwordDetail,
    Validator? validator,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          obscureText: !passwordDetail.isVisible,
          decoration: buildInputDecoration(passwordDetail, setState),
          onChanged: (value) => setState(() => passwordDetail.value = value),
          onSaved: (newValue) => passwordDetail.value = newValue,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your ${passwordDetail.name}';
            }

            if (value.length < 8) {
              return 'Please input at least 8 characters';
            }

            return validator?.call(value);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const gap = 10.0;
    final authRef = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: authRef.when(
        data: (data) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  const Gap(40),
                  buildFormField(
                    passwordDetail: newPass,
                  ),
                  const Gap(gap),
                  buildFormField(
                    passwordDetail: confirmPass,
                    validator: (value) {
                      if (value!.compareTo(newPass.value ?? '') != 0) {
                        return 'Both passwords are not match';
                      }

                      return null;
                    },
                  ),
                  const Spacer(flex: 4),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        overlayColor: Colors.transparent,
                        foregroundColor: const Color.fromRGBO(255, 31, 31, 1),
                        textStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const Gap(gap),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                      ),
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }

                        final messenger = ScaffoldMessenger.of(context);
                        final router = GoRouter.of(context);
                        formKey.currentState!.save();

                        final response = await ref
                            .read(authNotifierProvider.notifier)
                            .updateUserPassword(newPass.value!);

                        if (response) {
                          messenger.showSnackBar(const SnackBar(
                              content: Text('Password updated successfully')));

                          router.pop();
                        } else {
                          messenger.showSnackBar(const SnackBar(
                              content: Text('Password failed to update')));
                        }
                      },
                      child: const Text('Update'),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
        error: (e, st) => Text('Error: $e'),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
