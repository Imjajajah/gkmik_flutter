import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/register_page.dart';
import 'theme.dart';

void main() {
  runApp(GFMICApp());
}

class GFMICApp extends StatelessWidget {
  const GFMICApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}

