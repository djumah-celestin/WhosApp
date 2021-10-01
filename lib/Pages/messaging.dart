import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whosapp/Models/message.dart';
import 'package:whosapp/Models/users.dart';
import 'package:whosapp/Services/auth_services.dart';
import 'package:whosapp/Services/db_services.dart';
import 'package:whosapp/Widgets/messageComponent.dart';

class Messaging extends StatefulWidget {
  Messaging({Key key, this.user}) : super(key: key);
  final CUser user;

  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  var msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(
              width: _width / 35,
            ),
            CircleAvatar(
              radius: _heigth / 40,
              child: Icon(Icons.person),
              backgroundColor: Colors.grey.withOpacity(.7),
            ),
            SizedBox(
              width: _width / 35,
            ),
            Text(widget.user.name),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder<List<Message>>(
              stream: DBServices().getMessage(widget.user.uid),
              builder: (context, s1) {
                if (s1.hasData) {
                  return StreamBuilder<List<Message>>(
                    stream: DBServices().getMessage(widget.user.uid, false),
                    builder: (context, s2) {
                      if (s2.hasData) {
                        var messages = [...s1.data, ...s2.data];
                        messages
                            .sort((i, j) => i.createdAt.compareTo(j.createdAt));
                        messages.reversed.toList();
                        return messages.length == 0
                            ? Center(
                                child: Text('Aucun Message'),
                              )
                            : ListView.builder(
                                // reverse: true,
                                itemCount: messages.length,
                                itemBuilder: (context, index) {
                                  final msg = messages[index];
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10.0),
                                    child: MessageComponent(
                                      msg: msg,
                                    ),
                                  );
                                });
                      } else
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                    },
                  );
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              },
            )),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: msgController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                )),
                IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () async {
                      var msg = Message(
                          content: msgController.text,
                          receiverUID: widget.user.uid,
                          senderUID: AuthServices().user.uid,
                          createdAt: Timestamp.now());

                      await DBServices().sendMessage(msg);
                      msgController.clear();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
