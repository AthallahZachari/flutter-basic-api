import 'package:api/views/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: isLoggedIn ? HomePage() : HomePageTest(),
      home: HomePage(),
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
