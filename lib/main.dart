import 'package:accessibility_demo/not_accessible_page.dart';
import 'package:flutter/material.dart';

import 'accessible_page.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    showSemanticsDebugger: false,
        title: 'Accessibility Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(body: MainPage()),
      );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Accessible page'),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const AccessiblePage())),
          ),
          ElevatedButton(
            child: const Text('Not accessible page'),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const NotAccessiblePage())),
          ),
        ],
      );
}

