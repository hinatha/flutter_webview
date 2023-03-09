import 'package:flutter/material.dart'; // contains widgets implementing the Material Design guidelines
import 'package:flutter_riverpod/flutter_riverpod.dart'; // state management library for Flutter
import 'package:flutter_webview/view/input_page.dart'; // 'name in pubspec.yaml'/view/input_page.dart

// entry point of the application
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // It overrides the build() method to create the MaterialApp widget
  @override
  Widget build(BuildContext context) {
    // MaterialApp let us use material design
    return MaterialApp(
      // hides the debug banner in the top-right corner of the screen
      debugShowCheckedModeBanner: false,
      // the app title
      title: 'WebView',
      // Set default data in this app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // top page content
      home: const InputPage(),
    );
  }
}
