import 'package:flutter/material.dart';
import 'package:flutter_application_3/views/pages/HomePage.dart';
import 'package:flutter_application_3/views/pages/LoginPage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'home': (context) => HomePage(),
      },
    );
  }
}
