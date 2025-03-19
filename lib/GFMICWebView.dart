import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GFMICWebView extends StatefulWidget {
  const GFMICWebView({Key? key}) : super(key: key);

  @override
  _GFMICWebViewState createState() => _GFMICWebViewState();
}

class _GFMICWebViewState extends State<GFMICWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print("Page started loading: $url");

          },
          onPageFinished: (String url) {
            print("Page finished loading: $url");
          },
          onWebResourceError: (WebResourceError error) {
            print("Web resource error: ${error.description}");
          },
        ),
      )
      // ..loadRequest(Uri.parse("https://portal.gfmic.ph/membership"));
      // ..loadRequest(Uri.parse("https://flutter.dev"));
      ..loadRequest(Uri.parse("https://api.event.gfmic.ph/Event_Management/api/SpeakersDetails/"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView"),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}