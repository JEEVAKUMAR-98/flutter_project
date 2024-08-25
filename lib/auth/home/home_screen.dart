import 'package:flutter/material.dart';
import 'package:master_file_go/auth/signin.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                      (Route) => false);
                },
                child: const Text("sign out"))
          ],
        ),
      )),
    );
  }
}
