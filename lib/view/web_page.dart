import 'package:flutter/material.dart'; // contains widgets implementing the Material Design guidelines
import 'package:flutter_riverpod/flutter_riverpod.dart'; // state management library for Flutter
import 'package:flutter_webview/provider.dart'; // 'name in pubspec.yaml'/provider.dart
import 'package:webview_flutter/webview_flutter.dart'; // display web content within a Flutter app

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);
  @override
  // Manage web page state
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late WebViewController controller; // manage webview controller
  double progress = 0; // progress of loading the web page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebPage'),
        actions: [
          IconButton(
            onPressed: () async {
              if (await controller.canGoBack()) {
                controller.goBack(); // go back to former page
              }
            },
            icon: const Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              controller.reload(); // reload the web page
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          // Setting about progress bar
          LinearProgressIndicator(
            value: progress,
            color: Colors.red,
            backgroundColor: Colors.grey,
          ),
          Expanded(
            child: Consumer(
              builder: ((context, ref, child) {
                // Access provider to get the web url
                final _provider = ref.watch(provider.notifier);
                return WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: _provider.state, // the web url in provider state
                  onWebViewCreated: (controller) {
                    this.controller = controller; // Manage the web view
                  },
                  // When the web page is loading, showing a progress bar
                  // that is LinearProgressIndicator
                  onProgress: (progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
