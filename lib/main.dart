import 'package:flutter/material.dart';
import 'package:renseki_ui/ui/mobile_menu.dart';
import 'package:renseki_ui/ui/mobile_splash_screen.dart';
import 'package:renseki_ui/ui/mobile_welcome_screen.dart';
import 'package:renseki_ui/ui/registration_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: MenuScreen(),
        ),
      ),
    );
  }
}
