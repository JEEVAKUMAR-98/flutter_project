import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_file_go/auth/auth.methods.dart';
import 'package:master_file_go/auth/home/home_screen.dart';
import 'package:master_file_go/auth/signin.dart';

class Signupboard extends StatefulWidget {
  const Signupboard({super.key});

  @override
  State<Signupboard> createState() => _SignupboardState();
}

class _SignupboardState extends State<Signupboard> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNamecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPassHideen1 = true;
  GlobalKey<FormState> customkey = GlobalKey<FormState>();
  bool ispassHideen2 = true;

  @override
  void dispose() {
    emailController.dispose();
    userNamecontroller.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text("Sign up"),
        centerTitle: true,
        actions: const [Icon(Icons.horizontal_split)],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: customkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/navbar2.png",
                    // height: 45,
                    // width: 100,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{3,}$');
                          if (value!.isEmpty) {
                            return ("Username is required");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Username(Min. 3 Character)");
                          }
                          return null;
                        },
                        controller: userNamecontroller,
                        decoration: const InputDecoration(
                          labelText: "userName ",
                          border: OutlineInputBorder(),
                        ),
                        // const SizedBox(
                        // height: 10,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          {
                            if (value!.isEmpty) {
                              return ("Please enter your email");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            }
                            return null;
                          }
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                            labelText: "Email", border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Password is required");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Password(Min. 6 Character)");
                          }
                          return null;
                        },
                        obscureText: isPassHideen1,
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: "password ",
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPassHideen1 = !isPassHideen1;
                                  });
                                },
                                icon: isPassHideen1
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return ("Passwords do not match");
                          }
                          return null;
                        },
                        obscureText: ispassHideen2,
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                            labelText: "confirmpassword ",
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    ispassHideen2 = !ispassHideen2;
                                  });
                                },
                                icon: ispassHideen2
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (customkey.currentState!.validate()) {
                          AuthMethods()
                              .signUpUser(
                                  emailController.text,
                                  userNamecontroller.text,
                                  passwordController.text)
                              .then((value) => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen1())));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor("#20C3AF"),
                          shape: const BeveledRectangleBorder(),
                          minimumSize: const Size(220, 40)),
                      child: const Text(
                        "sign up",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: const Text("already have an account?sign in"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
