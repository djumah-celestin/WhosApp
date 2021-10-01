import 'package:flutter/material.dart';
import 'package:whosapp/Models/message.dart';

class MessageComponent extends StatefulWidget {
  MessageComponent({Key key, this.msg}) : super(key: key);
  final Message msg;
  @override
  _MessageComponentState createState() => _MessageComponentState();
}

class _MessageComponentState extends State<MessageComponent> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _heigth = MediaQuery.of(context).size.height;
    var _date = widget.msg.createdAt.toDate().toLocal();
    return Row(
      mainAxisAlignment:
          widget.msg.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: widget.msg.isMe
                      ? Colors.purple[200]
                      : Colors.black.withOpacity(.7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: widget.msg.isMe
                        ? Radius.circular(10)
                        : Radius.circular(0),
                    bottomRight: widget.msg.isMe
                        ? Radius.circular(0)
                        : Radius.circular(10),
                  )),
              constraints: BoxConstraints(
                  minWidth: 30, minHeight: 40, maxWidth: _width / 1.1),
              child: Text(
                widget.msg.content,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: widget.msg.isMe ? Colors.black : Colors.white),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(right: 5, bottom: 5),
                child: Text(
                  '${_date.hour}h${_date.minute}',
                  style: TextStyle(
                      color: widget.msg.isMe ? Colors.black : Colors.white,
                      fontSize: _heigth / 60),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
