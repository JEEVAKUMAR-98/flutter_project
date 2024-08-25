import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:master_file_go/auth/signin.dart';
import 'package:master_file_go/auth/signup.dart';
import 'package:master_file_go/crud_operation/crudonboard.dart';
import 'package:master_file_go/firebase_options.dart';
import 'package:master_file_go/hive/hive_screen_.dart';
import 'package:master_file_go/onboarding/onboard_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox<String>('notesBox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Ubuntu"),
      home: const SignIn(),
    );
  }
}
