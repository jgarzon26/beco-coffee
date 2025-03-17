import 'package:beco_coffee/auth/controller/auth_notifier.dart';
import 'package:beco_coffee/auth/model/user_profile.dart';
import 'package:beco_coffee/home/widget/profile/form_fields/date_form_field.dart';
import 'package:beco_coffee/home/widget/profile/form_fields/dropdown_form_field.dart';
import 'package:beco_coffee/home/widget/profile/info_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InfoEditOverlay extends ConsumerStatefulWidget {
  final VoidCallback? onSuccess;

  const InfoEditOverlay({
    super.key,
    this.onSuccess,
  });

  @override
  ConsumerState<InfoEditOverlay> createState() => _InfoEditOverlayState();
}

class _InfoEditOverlayState extends ConsumerState<InfoEditOverlay> {
  String? name, email, phone;
  Gender? gender;
  DateTime? birthdate;

  var dropdownKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();

  String? validate(String label, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $label';
    }

    return null;
  }

  void openDropDown() {
    GestureDetector? detector;
    void searchForGestureDetector(BuildContext context) {
      context.visitChildElements((context) {
        if (context.widget is GestureDetector) {
          detector = context.widget as GestureDetector;
        } else {
          searchForGestureDetector(dropdownKey.currentContext!);
        }
      });
    }

    searchForGestureDetector(context);

    if (detector?.onTap != null) {
      detector!.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final coffeeUser = ref.watch(authNotifierProvider);

    return Stack(
      children: [
        const Positioned.fill(
          child: ColoredBox(
            color: Colors.black38,
          ),
        ),
        Positioned.fill(
          left: 25,
          right: 25,
          top: 120,
          bottom: 100,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: coffeeUser.when(
              data: (user) {
                final userProfile = user?.userProfile;

                if (userProfile == null) {
                  return const Text('Unexpected error');
                }

                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Edit Info',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.black,
                                ),
                      ),
                      InfoFormField(
                        labelText: 'Fullname',
                        initialValue: userProfile.fullName,
                        validator: (value) => validate('fullname', value),
                        onSaved: (value) => name = value,
                      ),
                      InfoFormField(
                        labelText: 'Email',
                        initialValue: userProfile.email,
                        onSaved: (value) => email = value,
                      ),
                      InfoFormField(
                        labelText: 'Phone Number',
                        initialValue: userProfile.phone,
                        onSaved: (value) => phone = value,
                      ),
                      GestureDetector(
                        onTap: openDropDown,
                        child: DropdownFormField(
                          key: dropdownKey,
                          labelText: 'Gender',
                          initialValue: userProfile.gender,
                          items: Gender.values.map((gender) {
                            return DropdownMenuItem<Gender>(
                              value: gender,
                              child: Text(
                                gender.name,
                              ),
                            );
                          }).toList(),
                          onSaved: (newValue) => gender = newValue,
                        ),
                      ),
                      GestureDetector(
                        child: DateFormField(
                          labelText: 'BirthDate',
                          initialValue: userProfile.birthDate,
                          onSaved: (newValue) => birthdate = newValue,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                _formKey.currentState!.reset();
                              },
                              child: const Text('Reset'),
                            ),
                          ),
                          const Gap(5),
                          Expanded(
                            child: TextButton(
                              onPressed: () async {
                                if (!_formKey.currentState!.validate()) return;

                                if ((email == null) ^ (phone == null)) {
                                  return;
                                }

                                _formKey.currentState!.save();

                                final updated = UserProfile(
                                  email: email ?? userProfile.email,
                                  fullName: name ?? userProfile.fullName,
                                  address: userProfile.address,
                                  phone: phone ?? userProfile.phone,
                                  profilePicUrl: userProfile.profilePicUrl,
                                  birthDate: birthdate ?? userProfile.birthDate,
                                  gender: gender ?? userProfile.gender,
                                );

                                final scaffoldM = ScaffoldMessenger.of(context);

                                final status = await ref
                                    .read(authNotifierProvider.notifier)
                                    .updateUserProfile(
                                      updated,
                                    );

                                if (status) {
                                  scaffoldM.showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'User Profile Successfully Updated'),
                                    ),
                                  );
                                  if (widget.onSuccess != null) {
                                    widget.onSuccess!();
                                  }
                                } else {
                                  scaffoldM.showSnackBar(
                                    const SnackBar(
                                      content: Text('Failed to Update'),
                                    ),
                                  );
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              error: (e, stack) => Text(e.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
