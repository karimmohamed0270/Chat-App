import 'package:flutter/material.dart';
class buttoncontainer extends StatelessWidget {
  String text;
  Color butcolor;
  buttoncontainer({
    required this.text,
    required this.butcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: butcolor,
      ),
      width: double.infinity,
      height: 50,
      child: Center( child: Text(text)),
    );
  }
}