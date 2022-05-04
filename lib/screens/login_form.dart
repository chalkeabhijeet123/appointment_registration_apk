// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:appointment_registration_apk/services/database_service.dart';
import 'package:appointment_registration_apk/widgets/c_button.dart';
import 'package:appointment_registration_apk/widgets/c_textformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appointment_registration_apk/routes/route.dart' as route;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, this.hintText, this.loginData}) : super(key: key);
  final hintText;
  final loginData;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController textController = TextEditingController();
  late String textInput;
  TextEditingController passwordController = TextEditingController();
  late String passwordInput;

  bool obsecureText = true;

  var response = {};

  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  getLoginData() async {
    if (widget.hintText == 'Admin Login') {
      DocumentReference documentReferencer =
          DatabaseService().adminCollection.doc('H1OvIhbg3okAKXcNyjmC');
      DocumentSnapshot<Object?> data = await documentReferencer.get();
      response = data.data() as Map;
      print(response);
    } else {
      DocumentReference documentReferencer =
          DatabaseService().userCollection.doc('e0vsQpv88ieDrAoTtAz6');
      DocumentSnapshot<Object?> data = await documentReferencer.get();
      response = data.data() as Map;
      print(response);
    }
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
        title: Text(
          widget.hintText,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
        child: Column(
          children: [
            CommonTextFormField(
              controller: textController,
              hintText: widget.hintText,
              labelText: widget.hintText,
              prefixIcon: const Icon(
                Icons.person_outline_rounded,
                color: Colors.grey,
              ),
              onChanged: (value) {
                setState(() {
                  textInput = textController.text.toString();
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonTextFormField(
              controller: passwordController,
              hintText: 'Password',
              labelText: 'Password',
              obscureText: obsecureText,
              prefixIcon: const Icon(
                Icons.person_outline_rounded,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText;
                  });
                  // print(obsecureText);
                },
                icon: const Icon(
                  Icons.remove_red_eye_rounded,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  passwordInput = passwordController.text.toString();
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CommonButton(
              title: 'Login',
              color: Colors.greenAccent,
              onTap: () {
                if (widget.hintText == 'Admin Login') {
                  if (response['name'] == textInput &&
                      response['password'] == passwordInput) {
                    Navigator.pushNamed(context, route.appointmentListScreen);
                  }
                } else {
                  if (response['name'] == textInput &&
                      response['password'] == passwordInput) {
                    Navigator.pushNamed(context, route.appointmentFormScreen);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
