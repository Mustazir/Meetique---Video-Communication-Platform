import 'package:Meetique/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:Meetique/screens/login_screen.dart';
import 'package:Meetique/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meetique',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {'/login': (context) => const LoginScreen(),
      '/home': (context) => const HomeScreens()
      },
      home: const LoginScreen(),
    );
  }
}
