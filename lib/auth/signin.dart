import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_file_go/auth/auth.methods.dart';
import 'package:master_file_go/auth/forget.dart';
import 'package:master_file_go/auth/home/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isPassHidden = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text("Sign in"),
        centerTitle: true,
        actions: const [Icon(Icons.horizontal_split)],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(
              "assets/images/navbar.png",
              // height: 45,
              // width: 100,
            ),
            SizedBox(
              height: 45,
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: "Email", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: isPassHidden,
              decoration: InputDecoration(
                  labelText: "password ",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassHidden = !isPassHidden;
                        });
                      },
                      icon: isPassHidden
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility))),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForGetPassword()));
                  },
                  child: const Text(
                    "Forget password",
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  AuthMethods()
                      .signInUser(emailController.text, passwordController.text)
                      .then((value) {
                    Fluttertoast.showToast(msg: "Login Successful");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen1()),
                        (route) => false);
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("#20C3AF"),
                    shape: const BeveledRectangleBorder(),
                    minimumSize: const Size(220, 40)),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 40,
            ),
            RichText(
                text: const TextSpan(
                    text: "Don’t have an account? ",
                    children: <TextSpan>[
                  TextSpan(
                      text: "SignUp",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ))
                ])),
          ]),
        ),
      ),
    );
  }
}
