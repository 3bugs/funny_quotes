import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _rand = Random();

  static const List<String> _quoteList = [
    'น้ำขึ้นให้รีบตัก ผู้ชายทักให้รีบตอบ',
    'กลางคืนอย่างห้าว ตอนเช้าอย่างง่วง',
    'เคยเป็นแล้วคนดี ตอนนี้เป็นคนโสด',
    'สับรางไม่ไหว แต่สับไพ่สู้อยู่',
    'ก้าวแรกโดนใจ ก้าวต่อไปโดนเท',
  ];
  static const List<MaterialColor> _colorList = [
    Colors.red, Colors.blue,
  ];

  var _quote = _quoteList[0]; // state variable
  var _color = _colorList[0];

  void _handleClickGo() {
    String newQuote;
    do {
      var randomIndex = _rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    } while (newQuote == _quote);

    MaterialColor newColor;
    do {
      var randomIndex = _rand.nextInt(_colorList.length);
      newColor = _colorList[randomIndex];
    } while (newColor == _color);

    setState(() {
      _quote = newQuote;
      _color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคม/แคปชั่นกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleClickGo,
        child: const Text('Next Quote', textAlign: TextAlign.center,),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            _quote, // positional parameter/argument
            // named parameter/argument
            style: TextStyle(
              color: _color,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}