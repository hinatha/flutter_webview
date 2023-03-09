import 'package:adaptive_dialog/adaptive_dialog.dart'; // pre-built dialogs for different platforms
import 'package:flutter/material.dart'; // contains widgets implementing the Material Design guidelines
import 'package:flutter_riverpod/flutter_riverpod.dart'; // state management library for Flutter
import 'package:flutter_webview/provider.dart'; // 'name in pubspec.yaml'/provider.dart
import 'package:flutter_webview/view/web_page.dart'; // 'name in pubspec.yaml'/view/web_page.dart

class InputPage extends ConsumerWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // manage text field widget
    final _controller = TextEditingController();
    // ref.watch: listen to changes in the state and rebuild the widget tree.
    // provider.notifier: access the notifier property of the provider object.
    final _provider = ref.watch(provider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Page'),
        actions: [
          IconButton(
            onPressed: () {
              _controller.text = "";
            },
            icon: const Icon(Icons.autorenew),
          ),
        ],
      ),
      body: Padding(
        // Set padding in body
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              // change textfield state
              onChanged: (value) {
                _provider.state = value;
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_provider.state == "") {
                  // showOkAlertDialog is in adaptive_dialog package.
                  showOkAlertDialog(
                    // context provides the context of the current widget
                    context: context,
                    title: 'URLを入力してください',
                  );
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const WebPage()));
                }
              },
              child: const Text('OPEN WEB'),
            ),
          ],
        ),
      ),
    );
  }
}
