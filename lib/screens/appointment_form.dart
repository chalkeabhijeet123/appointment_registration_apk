// ignore_for_file: avoid_print

import 'package:appointment_registration_apk/services/database_service.dart';
import 'package:appointment_registration_apk/widgets/c_button.dart';
import 'package:appointment_registration_apk/widgets/c_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({Key? key}) : super(key: key);

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  TextEditingController nameController = TextEditingController();
  String? nameInput;
  TextEditingController emailController = TextEditingController();
  String? emailInput;
  TextEditingController dateController = TextEditingController();
  String? dateInput;
  // TextEditingController timeController = TextEditingController();
  String? timeInput;
  TextEditingController commentController = TextEditingController();
  String? commentInput;

  var items = [
    '09.30 AM',
    '10.30 AM',
    '11.30 AM',
    '12.30 AM',
    '01.30 PM',
    '02.30 PM',
    '03.30 PM',
    '04.30 PM',
    '05.30 PM',
    '06.30 PM',
    '07.30 PM',
  ];

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 169, 195, 240),
        leading: InkWell(
          onTap: (() => Navigator.pop(context)),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Appointment Booking',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            CommonTextFormField(
              controller: nameController,
              hintText: 'Name',
              labelText: 'Name',
              prefixIcon: const Icon(
                Icons.person_outline_rounded,
                color: Colors.grey,
              ),
              onChanged: (value) {
                setState(() {
                  nameInput = nameController.text.toString();
                });
              },
            ),
            CommonTextFormField(
              controller: emailController,
              hintText: 'Email',
              labelText: 'Email',
              prefixIcon: const Icon(
                Icons.email_rounded,
                color: Colors.grey,
              ),
              onChanged: (value) {
                setState(() {
                  emailInput = emailController.text.toString();
                });
              },
            ),
            CommonTextFormField(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (String item in items)
                    InkWell(
                      onTap: () {
                        setState(() {
                          timeInput = item;
                        });
                        print(timeInput);
                      },
                      child: TimeContainer(
                        item: item,
                      ),
                    ),
                ],
              ),
            ),
            CommonTextFormField(
              controller: commentController,
              hintText: 'Comment',
              labelText: 'Comment',
              prefixIcon: const Icon(
                Icons.comment_rounded,
                color: Colors.grey,
              ),
              onChanged: (value) {
                setState(() {
                  commentInput = commentController.text.toString();
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonButton(
              title: 'Submit',
              color: const Color.fromARGB(255, 245, 215, 48),
              onTap: () {
                print('submit button pressed');
                var map = {
                  'name': nameInput!,
                  'email': emailInput!,
                  'date': dateInput!,
                  'time': timeInput!,
                  'comment': commentInput!,
                };
                DatabaseService().bookAppoointment(map);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class TimeContainer extends StatelessWidget {
  const TimeContainer({Key? key, required this.item}) : super(key: key);
  final String item;
  final bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      // padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: selected == false
              ? const Color.fromARGB(255, 165, 194, 241)
              : const Color.fromARGB(255, 211, 165, 241),
          border: Border.all(color: Colors.blue.shade700, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          item,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
