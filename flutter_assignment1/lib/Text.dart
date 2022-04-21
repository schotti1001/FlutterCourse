import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  var outputText;

  MyText(this.outputText);

  @override
  Widget build(BuildContext context) {
    return Text(outputText);
  }
}
