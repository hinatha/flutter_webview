import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webview/view/input_page.dart'; // 'root folder name'/view/input_page.dart

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InputPage(),
    );
  }
}
