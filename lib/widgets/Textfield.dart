import 'package:flutter/material.dart';
class TextfieldLogin extends StatelessWidget {
  String TextHint;
  // i send the data on the custom text field to it
  Function(String)?onchange;
  bool ? obstruct ;
 TextfieldLogin({required this.TextHint,this.onchange,this.obstruct =false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obstruct!,
      onChanged: onchange,
      validator: (data) {
        if(data!.isEmpty){
          return("Error you should enter the value on it");
        }
        
      },
      decoration: InputDecoration(
          hintText: TextHint,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          ))),
    );
  }
}