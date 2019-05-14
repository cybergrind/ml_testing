import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WordsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WordsState();
}

class WordsState extends State<WordsList> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    return ListView.builder(
      itemBuilder: (context, i) {
        print('Index is $i');
        if (i == 0) {
          return Text(wordPair.asPascalCase,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold));
        }
        if (i > 0) {
          return Text(WordPair.random().asPascalCase,
              style: TextStyle(fontSize: 26));
        }
      },
    );
  }
}
