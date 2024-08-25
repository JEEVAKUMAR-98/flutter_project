import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_file_go/auth/signup.dart';
import 'package:master_file_go/onboarding/onboard_model.dart';

class OnBoardScreen1 extends StatefulWidget {
  const OnBoardScreen1({super.key});

  @override
  State<OnBoardScreen1> createState() => _OnboardScreensState();
}

class _OnboardScreensState extends State<OnBoardScreen1> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  get currentIndexPage => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: screens.length,
              onPageChanged: (i) {
                setState(() {
                  currentIndex = i;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          screens[index].header,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: HexColor("#525464")),
                        ),
                        Image.asset(screens[index].imagepath),
                        Text(
                          screens[index].body,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: HexColor("#525464"), fontSize: 18),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        currentIndex != 3
                            ? DotsIndicator(
                                dotsCount: screens.length,
                                position: currentIndex,
                                decorator: DotsDecorator(
                                  size: const Size.square(9.0),
                                  activeSize: const Size(18.0, 9.0),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              )
                            : const SizedBox(),
                        currentIndex != 3
                            ? InkWell(
                                onTap: () => pageController.nextPage(
                                    curve: Curves.easeIn,
                                    duration:
                                        const Duration(milliseconds: 400)),
                                child: Container(
                                  height: 60,
                                  width: 320,
                                  color: HexColor("#20C3AF"),
                                  child: const Center(
                                    child: Text(
                                      "Next",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ))
                            : ElevatedButton(
                                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const Signupboard()));},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor("#20C3AF"),
                                    shape: const CircleBorder(),
                                    minimumSize: const Size(70, 70)),
                                child: const Icon(
                                  size: 30,
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )
                      ],
                    ),
                  ),
                );
              }),
        ],
      )),
    );
  }
}
