import 'package:appointment_registration_apk/screens/login_form.dart';
import 'package:appointment_registration_apk/widgets/c_button.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          'Login',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonButton(
              color: const Color.fromARGB(255, 233, 138, 94),
              title: 'Admin Login',
              onTap: () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginForm(
                            hintText: 'Admin Login',
                          )),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            CommonButton(
              color: const Color.fromARGB(255, 128, 212, 238),
              title: 'User Login',
              onTap: () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginForm(
                            hintText: 'User Login',
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
