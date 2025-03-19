import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'screens/landing_page.dart';
import 'screens/speaker_list.dart';
import 'screens/register_page.dart';
import 'GFMICWebView.dart';
import 'theme.dart';

void main() {

  print("Initializing WebView platform...");
  if (WebViewPlatform.instance == null) {
    print("WebViewPlatform is null. Setting AndroidWebViewPlatform.");
    WebViewPlatform.instance = AndroidWebViewPlatform();
  } else {
    print("WebViewPlatform is already initialized.");
  }
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
        '/webview': (context) => const GFMICWebView(),
        '/speakers': (context) => SpeakersList(),
      },
    );
  }
}