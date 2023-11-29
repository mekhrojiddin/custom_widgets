import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyButton extends StatelessWidget{
  final String  text;
  final Function() onPressed;
  final Function() onLongPress;

  const MyButton({Key? key, required this.text, required this.onPressed, required this.onLongPress}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onLongPress:onLongPress,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Text(text),
      ),
    );
  }}