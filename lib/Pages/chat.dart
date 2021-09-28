import 'package:flutter/material.dart';
import 'package:whosapp/Configs/functions.dart';
import 'package:whosapp/Pages/contacts.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToNextPage(context, Contacts());
        },
        child: Icon(Icons.message_rounded),
      ),
    );
  }
}
