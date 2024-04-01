import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(
            child: const Text(
              'DICE',
              style: TextStyle(
                color: Colors.white,
                fontFamily: CupertinoIcons.iconFont,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int img_numb = 1;
  int img_numb2 = 2;

  void rollDice() {
    setState(() {
      img_numb = 1 + Random().nextInt(6);
      img_numb2 = 1 + Random().nextInt(6);
    });
  }

  int get sum => img_numb + img_numb2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: rollDice,
                  child: Image(image: AssetImage('images/dice$img_numb.png')),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: rollDice,
                  child: Image(image: AssetImage('images/dice$img_numb2.png')),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            '$img_numb + $img_numb2 = $sum',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
