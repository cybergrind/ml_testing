// Flutter code sample for widgets.SingleChildScrollView.2

// In this example, the column becomes either as big as viewport, or as big as
// the contents, whichever is biggest.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
          bottomSheet: LoginForm(),
        ));
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (context, i) {
        print('Index is $i');
        if (i == 0) {
          return Text(wordPair.asPascalCase, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold));
        }
        if (i > 0) {
          return Text(WordPair.random().asPascalCase, style: TextStyle(fontSize: 26));
        }
      },
    );
  }
}
