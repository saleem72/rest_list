import 'package:flutter/material.dart';
import 'package:rest_list/helpers/styling/pallet.dart';
import 'package:rest_list/screens/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Pallet.primarySwatch,
        scaffoldBackgroundColor: Pallet.background,
        fontFamily: 'Lato',
      ),
      home: const LoginScreen(),
    );
  }
}
