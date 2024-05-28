import 'dart:html' as html;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World Web'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20), // Adds some space between the text and the button
            ElevatedButton(
              onPressed: () {
                _trackEvent('ButtonClick', {'button': 'Click Me'});
                print('Button clicked!');
              },
              child: Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }

  void _trackEvent(String event, [Map<String, dynamic>? parameters]) {
    final params = parameters ?? {};
    html.window.callMethod('fbq', ['track', event, params]);
  }
}
