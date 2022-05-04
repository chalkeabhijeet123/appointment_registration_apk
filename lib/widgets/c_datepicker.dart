// ignore_for_file: avoid_print

import 'package:appointment_registration_apk/widgets/c_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatepicker extends StatefulWidget {
  const CustomDatepicker({Key? key}) : super(key: key);

  @override
  State<CustomDatepicker> createState() => _CustomDatepickerState();
}

class _CustomDatepickerState extends State<CustomDatepicker> {
  TextEditingController dateController = TextEditingController();
  String? dateInput;

  datePicker() {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    ).then((date) {
      // dateInput = dateController.value.toString();
      var formatted = formatter.format(date!);
      dateController.text = formatted.toString();
      setState(() {
        dateInput = dateController.text.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
      controller: dateController,
      hintText: 'Date',
      labelText: 'Date',
      prefixIcon: const Icon(
        Icons.calendar_month_rounded,
        color: Colors.grey,
      ),
      readOnly: true,
      onTap: () => datePicker(),
      onChanged: (value) {
        setState(() {
          dateInput = dateController.text.toString();
          print(dateInput);
        });
      },
    );
  }
}
