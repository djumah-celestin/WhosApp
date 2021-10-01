import 'package:flutter/material.dart';
import 'package:whosapp/Configs/functions.dart';
import 'package:whosapp/Models/users.dart';
import 'package:whosapp/Pages/messaging.dart';
import 'package:whosapp/Services/db_services.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Utilisateurs"),
      ),
      body: StreamBuilder<List<CUser>>(
        stream: DBServices().getDiscussionUsers,
        builder: (_, s) {
          if (s.hasData) {
            final users = s.data;
            return users.length == 0
                ? Center(
                    child: Text("Aucune Discussion"),
                  )
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (ctx, i) {
                      final user = users[i];
                      return ListTile(
                          onTap: () {
                            navigateToNextPage(context, Messaging(user: user));
                          },
                          leading: Container(
                            alignment: Alignment.center,
                            height: _height / 15,
                            width: _height / 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            child: Icon(Icons.person),
                          ),
                          title: Text(user.name),
                          subtitle: Text(user.email));
                    });
          } else {
            return (Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
