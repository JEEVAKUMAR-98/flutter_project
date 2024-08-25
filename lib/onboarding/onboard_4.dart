import 'package:flutter/material.dart';

class OnBoardingPage4 extends StatelessWidget {
  const OnBoardingPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Create \n order",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      // color: Hexcolour("#525464"),
                      fontSize: 50),
                ),
                Image.asset("assets/images/page4.png"),
                const Text("It's easy, just click on the plus"),
              
                // const Text(""),
                // InkWell(
                //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const OnBoardingPage4())),
                //   child: Container(
                //     height: 40,
                //     width: 120,
                //     color: HexColor("#20C3AF"),
                //     child: const Center(child: Text("Next", style: TextStyle(color: Colors.white),),),

                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
