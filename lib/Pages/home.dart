import 'package:flutter/material.dart';
import 'package:whosapp/Services/auth_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await AuthServices().signOut();
              })
        ],
      ),
    );
  }
}
