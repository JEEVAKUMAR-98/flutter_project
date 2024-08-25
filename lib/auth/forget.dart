import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:master_file_go/auth/auth.methods.dart';
import 'package:master_file_go/auth/signin.dart';

class ForGetPassword extends StatefulWidget {
  const ForGetPassword({super.key});

  @override
  State<ForGetPassword> createState() => _ForGetPasswordState();
}

class _ForGetPasswordState extends State<ForGetPassword> {
  TextEditingController emailcontroller = TextEditingController();
  GlobalKey<FormState> customkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text("Forget Password"),
        centerTitle: true,
        // actions: const [Icon(Icons.horizontal_split)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: customkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Restart Your Mail"),
              Image.asset("assets/images/navbar.png"),
              const SizedBox(height: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  {
                    if (value!.isEmpty) {
                      return ("Please enter your email");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please enter a valid email");
                    }
                    return null;
                  }
                },
                controller: emailcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ENTER YOUR EMAIL',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: TextButton.styleFrom(

                    // primary: Colors.blue,
                    ),
                onPressed: () {
                  if (customkey.currentState!.validate()) {
                    AuthMethods()
                        .forgotPassword(emailcontroller.text)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "Reset Password Link Sent Successfully !");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                          (route) => false);
                    });
                  }
                },
                child: const Text('Restart Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
