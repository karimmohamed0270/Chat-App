import 'package:flutter/foundation.dart';

// make from collection a model

class Message{

  final String body;
  final String id;

  Message(this.body,this.id);

//  what i want to get from db >>> body
  factory Message.fromJson(jsonData){

    return Message(jsonData['body'],jsonData['id']);

  }
}


