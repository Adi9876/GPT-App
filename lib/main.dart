import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var pageError = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 12),
        child: pageError == false
            ? WebView(
                onWebResourceError: (error) {
                  setState(() {
                    pageError = true;
                  });
                },
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://chat.openai.com',
              )
            : Center(
                child: Lottie.asset('assets/nointernet.json',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8),
              ),
      )),
    );
  }
}
