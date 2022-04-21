// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';
import 'package:flutter_assignment1/TextControl.dart';
import 'Text.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  var _outputText = "Text";

  void _changeText() {
    setState(() {
      _outputText = _outputText + ".";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Some Text"),
      ),
      body: Column(
        children: [
          MyText(_outputText),
          TextControl(_changeText),
        ],
      ),
    ));
  }
}
