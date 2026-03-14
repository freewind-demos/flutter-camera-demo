// Flutter 相机
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Camera Demo')),
        body: Center(
          child: Text('Use camera package'),
        ),
      ),
    );
  }
}
