import 'package:flutter/material.dart';
import 'package:myschool/Screens/CreateGroup.dart';
import 'package:myschool/Screens/HomeTabs/LibraryTabs/Docs.dart';
import 'package:myschool/Screens/HomeTabs/LibraryTabs/Images.dart';
import 'package:myschool/Screens/HomeTabs/LibraryTabs/Video.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DefaultTabController(
          length: 4,
          child: ListView(
            children: <Widget>[
              Container(
                height: 50,
                child: TabBar(
                  indicatorColor: Colors.amber,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        'Videos',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Images',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Docs',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Search Library',
                        style: TextStyle(color: Colors.orange),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.56,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[Video(),Images(),Docs(), Text('Search Library')],
                ),
              ),
            ],
          ),
        ),
        Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width / 1.3,
                MediaQuery.of(context).size.height / 1.8),
            child: FloatingActionButton(
                backgroundColor: Colors.amber,
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return CreateGroups();
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
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
                onPressed: () {})),
      ],
    );
  }
}
