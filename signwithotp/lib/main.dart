import 'package:flutter/material.dart';
import 'package:signup_with_otp/screens/otp_screen.dart';
import 'package:signup_with_otp/screens/add_your_number.dart';
import 'package:signup_with_otp/screens/language_selection.dart';
import 'package:signup_with_otp/screens/role_selection.dart';
import 'package:signup_with_otp/screens/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LanguageSelectionScreen(),
      routes: {
        'role': (context)=> RoleSelectionScreen(),
        'lang': (context)=> LanguageSelectionScreen(),
        'signup': (context)=> RegistrationScreen(),
        'add_phone':(context)=> AddNumberScreen(),
        'otp':(context)=> VerificationScreen(),
      },
    );
  }
}

