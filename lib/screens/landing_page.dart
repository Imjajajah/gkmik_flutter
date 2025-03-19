import 'package:flutter/material.dart';
import '../theme.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          "GFMIC Membership",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to GFMIC",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Become a part of our growing community!",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white, // Correct way to set text color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text("Become a Member"),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppTheme.primaryColor),
                foregroundColor: AppTheme.primaryColor, // Correct text color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Login"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/webview');
              },
              child: Text("Open Web Page"),
           ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)
,              ),
              onPressed: (){
                Navigator.pushNamed(context, '/speakers');

              },
              child: Text("View Speaker"),
            ),
          ],
        ),
      ),
    );
  }
}