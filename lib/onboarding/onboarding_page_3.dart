import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_file_go/onboarding/onboard_4.dart';

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Honest \n rating",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      color: HexColor("#525464"),
                      fontSize: 50),
                ),
                Image.asset("assets/images/Page.3.png"),
                const Text(
                  "We carefully check each specialist and put honest rating",
                  textAlign: TextAlign.center,
                ),
                const Text(""),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnBoardingPage4())),
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
