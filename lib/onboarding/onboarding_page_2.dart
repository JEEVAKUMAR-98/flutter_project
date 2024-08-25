import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_file_go/onboarding/onboarding_page_3.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Insured \n orders ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      // color: HexColor("#525464"),
                      fontSize: 50),
                ),
                Image.asset("assets/images/onboard2.png"),
                const Text("We insure each order for the \n amount of \$500"),
                const Text(""),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnBoardingPage3())),
                  child: Container(
                    height: 40,
                    // width: 120,
                    color: HexColor("#20C3AF"),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
