import 'package:beco_coffee/home/widget/profile/custom_form_field_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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