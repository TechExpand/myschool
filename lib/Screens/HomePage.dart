import 'package:flutter/material.dart';
import 'package:myschool/Screens/HomeTabs/Library.dart';
import 'package:myschool/Screens/HomeTabs/Mail.dart';
import 'package:myschool/Screens/SearchGroups.dart';

class MySchoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return SearchGroups();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ],
            backgroundColor: Colors.lightBlueAccent,
            title: Text('MYCLAS'),
            centerTitle: true,
            bottom: TabBar(
              indicatorWeight: 2,
              indicatorColor: Colors.amber,
              tabs: <Widget>[
                Tab(
                  text: 'Mail',
                  icon: Icon(Icons.home),
                ),
//                Tab(
//                  text: 'Discussions',
//                  icon: Icon(Icons.question_answer),
//                ),
                Tab(
                  text: 'Library',
                  icon: Icon(Icons.class_),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Mail(),
//              Discussion(),
              Library(),
            ],
          ),
        ));
  }
}
