import 'package:beco_coffee/auth/model/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class InfoEditOverlay extends ConsumerStatefulWidget {
  const InfoEditOverlay({super.key});

  @override
  ConsumerState<InfoEditOverlay> createState() => _InfoEditOverlayState();
}

class _InfoEditOverlayState extends ConsumerState<InfoEditOverlay> {
  String name = '';
  String? email, phone;
  Gender? gender;
  DateTime? birthdate;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Edit Info',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  InfoFormField(
                    labelText: 'Fullname',
                    initialValue: '',
                    validator: (value) => validate('fullname', value),
                    onSaved: (value) => name = value!,
                  ),
                  InfoFormField(
                    labelText: 'Email',
                    initialValue: '',
                    onSaved: (value) => email = value,
                  ),
                  InfoFormField(
                    labelText: 'Phone Number',
                    initialValue: '',
                    onSaved: (value) => phone = value,
                  ),
                  DropdownFormField(
                    labelText: 'Gender',
                    initialValue: null,
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
                  DateFormField(
                    labelText: 'BirthDate',
                    initialValue: null,
                    onSaved: (newValue) => birthdate = newValue,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                      const Gap(5),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            _formKey.currentState!.reset();
                          },
                          child: const Text('Reset'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  String? validate(String label, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $label';
    }

    return null;
  }
}

class InfoFormField extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final String? errorText;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;

  const InfoFormField({
    super.key,
    required this.labelText,
    required this.initialValue,
    this.errorText,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}

class DropdownFormField<T> extends FormField<T> {
  DropdownFormField({
    super.key,
    required List<DropdownMenuItem<T>> items,
    String? labelText,
    super.initialValue,
    super.validator,
    super.onSaved,
  }) : super(
          builder: (state) {
            return CustomFormFieldFormat(
              labelText: labelText ?? '',
              suffixButton: DropdownButton(
                items: items,
                value: initialValue,
                onChanged: (value) {
                  state.didChange(value);
                },
              ),
            );
          },
        );
}

class DateFormField extends FormField<DateTime> {
  DateFormField({
    super.key,
    String? labelText,
    super.initialValue,
    super.validator,
    super.onSaved,
  }) : super(
          builder: (state) {
            return CustomFormFieldFormat(
              labelText: labelText,
              valueText: state.value != null
                  ? DateFormat.yMMMd().format(state.value!)
                  : '',
              suffixButton: IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.black54,
                  ),
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: state.context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      currentDate: initialValue,
                    );

                    state.didChange(pickedDate);
                  }),
            );
          },
        );
}

class CustomFormFieldFormat extends StatelessWidget {
  final String? labelText;
  final String? valueText;
  final Widget? suffixButton;

  const CustomFormFieldFormat({
    super.key,
    this.labelText,
    this.valueText,
    this.suffixButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black54),
        ),
      ),
      child: Row(
        children: [
          Text(
            labelText ?? '',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black87,
                ),
          ),
          const Spacer(),
          if (valueText != null)
            Text(
              valueText!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
            ),
          const Gap(5),
          if (suffixButton != null) suffixButton!,
        ],
      ),
    );
  }
}
