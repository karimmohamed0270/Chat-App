import 'dart:js';

import 'package:chat/constents.dart';
import 'package:chat/models/Message.dart';
import 'package:flutter/material.dart';

import '../widgets/chatbubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  // Create a CollectionReference called users that references the firestore collection
  // make firestore to collection
  CollectionReference message =
      FirebaseFirestore.instance.collection('Messages');

  TextEditingController controller = TextEditingController();

  //  to make scrrol in listview to end auto first make object
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    // recieve email as constractor from login page

    var email = ModalRoute.of(context)!.settings.arguments;
    // cloudfirestore to recieve data in db to shoew it i dont use  FutureBuilderin this case i want to update in real time then use strem builder
    return StreamBuilder<QuerySnapshot>(
        // recieve the data   it stored from document in DB
        stream: message.orderBy(ktime, descending: true).snapshots(),
        //  store it to use it in app
        builder: (context, snapshoot) {
          if (snapshoot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshoot.connectionState == ConnectionState.waiting) {
            return Text("Loading");

            // success
          } else {
            List<Message> messagelist = [];
            for (var i = 0; i < snapshoot.data!.docs.length; i++) {
              messagelist.add(Message.fromJson(snapshoot.data!.docs[i]));
              // i will get body and email from DB and store it in the list
            }
            return Scaffold(
                appBar: AppBar(
                  // to hide back button
                  automaticallyImplyLeading: false,
                  backgroundColor: kPrimaryColor,
                  title: (Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        kLogo,
                        height: 50,
                      ),
                      Text("Chat"),
                    ],
                  )),
                  centerTitle: true,
                ),
                // listviw.builder >>>to make loop
                // ?lisview only >>>if i know the number of the message not loop

                // when i make listview.builder the width of the container take all width

                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          itemCount: messagelist.length,
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            return messagelist[index].id == email
                                ? ChatBubble(
                                    mess: messagelist[index],
                                  )
                                : ChatBubbleFriends(mess: messagelist[index]);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        // controller to delete text filed after i send
                        controller: controller,
                        // store the message into db

                        onSubmitted: (data) {
                          message.add(
                              // body name of column in db
                              {
                                'body': data,
                                ktime: DateTime.now(),
                                'id': email
                              });

                          // after i send the mes tf clear

                          controller.clear();

                          // go to end of the list view after i send the message  of listview

                          _scrollController.animateTo(
                            // _scrollController.position.maxScrollExtent,
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          );
                        },

                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                          hintText: "Enter The Message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: kPrimaryColor)),
                        ),
                      ),
                    )
                  ],
                ));
          }
        });
  }
}
