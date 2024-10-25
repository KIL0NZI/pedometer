import 'package:flutter/material.dart';
import 'package:pedometer/models/new_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NewUser newUser = NewUser();
    return MaterialApp(
      home: newUser.firstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
