import 'dart:math';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Color? _backgroundColor;
  Color? _textColor;

  dynamic changeColor() {
    setState(() {
      _backgroundColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
      _textColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
    });
  }

  @override
  void initState(){
    changeColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => changeColor(),
      child: Container(
        alignment: Alignment.center,
        color: _backgroundColor,
        child: Stack(
          children: <Widget>[
            // Stroked text as border.
            Text(
              'Hey there!',
              style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.blue[700]!,
                  decoration: TextDecoration.none
              ),
            ),
            // Solid text as fill.
            Text(
              'Hey there!',
              style: TextStyle(
                  fontSize: 40,
                  color: _textColor,
                  decoration: TextDecoration.none
              ),
            ),
          ],
        ),
      ),
    );
  }

}