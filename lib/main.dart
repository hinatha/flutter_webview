import 'package:flutter/material.dart'; // contains widgets implementing the Material Design guidelines
import 'package:flutter_riverpod/flutter_riverpod.dart'; // state management library for Flutter
import 'package:flutter_webview/view/input_page.dart'; // 'root folder name'/view/input_page.dart

// entry point of the application
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// StatelessWidget can make widgets easily and in material.dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // It overrides the build() method to create the MaterialApp widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // hides the debug banner in the top-right corner of the screen
      debugShowCheckedModeBanner: false,
      // the app title in the widget
      title: 'WebView',
      // widget color
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // top page content
      home: const InputPage(),
    );
  }
}
