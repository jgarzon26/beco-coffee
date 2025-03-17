import 'package:beco_coffee/home/widget/profile/custom_form_field_format.dart';
import 'package:flutter/material.dart';

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
                key: key,
                items: items,
                value: initialValue ?? state.value,
                onChanged: (value) {
                  state.didChange(value);
                },
              ),
            );
          },
        );
}
