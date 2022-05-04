import 'package:appointment_registration_apk/widgets/c_button.dart';
import 'package:flutter/material.dart';
import 'package:appointment_registration_apk/routes/route.dart' as route;
import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  TextEditingController dateController = TextEditingController();
  late String dateInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: AssetImage(''),
        // child: Image.asset('assets/images/appointment_svg.svg')),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            CommonButton(
              color: Colors.blueAccent,
              title: 'Let\'s Start',
              onTap: () => Navigator.pushNamed(context, route.loginScreen),
            )
          ],
        ),
      ),
    );
  }
}
