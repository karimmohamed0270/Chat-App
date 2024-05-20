import 'package:chat/models/Message.dart';
import 'package:flutter/material.dart';

import '../constents.dart';
class ChatBubble extends StatelessWidget {

  final Message mess;
  const ChatBubble({
    super.key,required this.mess
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // align dont make container take all width of the screen
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container( 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
                color:kPrimaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              mess.body,
              style: TextStyle(color: Colors.white),
      
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBubbleFriends extends StatelessWidget {

  final Message mess;
  const ChatBubbleFriends({
    super.key,required this.mess
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // align dont make container take all width of the screen
      child: Align(
        alignment: Alignment.centerRight,
        child: Container( 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30)),
                color:Colors.blueGrey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              mess.body,
              style: TextStyle(color: Colors.white),
      
            ),
          ),
        ),
      ),
    );
  }
}