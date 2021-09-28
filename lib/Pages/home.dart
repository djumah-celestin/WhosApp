import 'package:flutter/material.dart';
import 'package:whosapp/Pages/appel.dart';
import 'package:whosapp/Pages/chat.dart';
import 'package:whosapp/Pages/post.dart';
import 'package:whosapp/Pages/status.dart';
import 'package:whosapp/Services/auth_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabBar get _tabBar => TabBar(
        tabs: [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.camera_alt_rounded),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    "DISC.",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    "Appels",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
        unselectedLabelColor: Colors.purple[200],
        indicatorColor: Colors.purple,
        labelColor: Colors.white,
      );
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                    child: ColoredBox(color: Colors.purple, child: _tabBar),
                    preferredSize: _tabBar.preferredSize),
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: _height / 40,
                      backgroundColor: Colors.purple,
                      backgroundImage: AssetImage("assets/images/whitemsg.png"),
                    ),
                    SizedBox(
                      width: _width / 25,
                    ),
                    Text("WhosApp"),
                  ],
                ),
                actions: [
                  IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () async {
                        await AuthServices().signOut();
                      })
                ],
              ),
            ];
          },
          body: TabBarView(
            children: [
              Center(
                child: Post(),
              ),
              Center(
                child: Chat(),
              ),
              Center(
                child: Status(),
              ),
              Center(
                child: Appels(),
              ),
            ],
          )),
    );
  }
}
