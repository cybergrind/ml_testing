// Flutter code sample for widgets.SingleChildScrollView.2

// In this example, the column becomes either as big as viewport, or as big as
// the contents, whichever is biggest.

import 'package:flutter/material.dart';
import './words_widget.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'test app',
        home: Scaffold(
          appBar: AppBar(title: Text('TITLE')),
          body: Center(
            child: Text(
              'lolll1',
              style: TextStyle(fontSize: 80, fontFamily: 'monospace'),
            ),
          ),
          bottomSheet: WordsList(),
        ));
  }
}
